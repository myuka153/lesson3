<html>
  <head>
    <meta charset="utf-8" />
    <script src="https://unpkg.com/three@0.137.4/build/three.min.js"></script>
    <script src="https://unpkg.com/three@0.137.4/examples/js/controls/OrbitControls.js"></script>
  </head>
<body>
 <script>
      // ページの読み込みを待つ
      window.addEventListener('DOMContentLoaded', init);

      function init() {
        // サイズを指定
        const width = 800
        const height = 600;

        // レンダラーを作成
        var renderer = new THREE.WebGLRenderer();
        document.body.appendChild(renderer.domElement);
        renderer.setSize(width, height);

        // シーンを作成
        const scene = new THREE.Scene();

        // カメラを作成
        const camera = new THREE.PerspectiveCamera(45, width / height);
        // カメラの初期座標を設定
        camera.position.set(0, 0, 5);

        // カメラコントローラーを作成
        const controls = new THREE.OrbitControls(camera, document.body); 
        
        // 平行光源1
        var directionalLight1 = new THREE.DirectionalLight(0xffffff);
        directionalLight1.position.set(10, 10, 10);
        // シーンに追加
        scene.add(directionalLight1);
        // 平行光源2
        var directionalLight2 = new THREE.DirectionalLight(0x888888);
        directionalLight2.position.set(-10, -10, 10);
        // シーンに追加
        scene.add(directionalLight2);

        // helper
        const gridHelper = new THREE.GridHelper(2,10); // size, step
        scene.add(gridHelper);
        const axisHelper = new THREE.AxisHelper(2); //軸の長さ　X：赤、Y：緑、z：青
        scene.add(axisHelper);

        // テクスチャー読み込み
        var textureLoader = new THREE.TextureLoader();  
        var texture = textureLoader.load("img/img2.png");
        var mat = new THREE.MeshPhongMaterial();
        mat.map = texture;

        
        // 球を作成
        var geometry2 = new THREE.SphereGeometry(0.5, 32, 32 ); ;
        var Sphere1 = new THREE.Mesh(geometry2, mat);
        Sphere1.position.set(0,0,0);
        scene.add(Sphere1);
        

        


        update();

        // 毎フレーム時に実行されるループイベントです
        function update() {
          // レンダリング
          renderer.render(scene, camera);
          requestAnimationFrame(update);

         

          // 箱を回転させる
          Sphere1.rotation.x += 0.01;
         

         
        }
      }
    </script>
</body>
</html>
