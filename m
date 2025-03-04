Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177FF280A2A
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102556; cv=none; b=Vo37CaNDcQz9XtFAkCvw3CbNYAj/Pvsskh2xPP30yvSX4MsTsl0xqpRhB3YMsqIJYNJLYk5lD1grLVGUAUD+XMO6oC043VjyBYfBvjVGAfwwhWvnfw8i+F5YO/MrT+DOqXvQTliVv7O+v07axcZzynMmlvW4rXGy8YdDjvC1blE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102556; c=relaxed/simple;
	bh=SEwtxkr82AoCWr4JQqdNtQ1RgcxKJ0Fknk+gclPMdr4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rqcDaYjb+uZUESEma9uRBMtNkLYbC0wO+fJYUf6uQ4SQl0zpYZ6gn9MN10eYbhf5fRfl6x5UTb3HGszXv+UoJVRktWAdfH9Qp/qqKqoGQos8m/2n06u31271blUM+hFIwEALVaK3e0z5SeIHYEDv+vVzx2XoDmCyTaLzOKw3u6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fhu+EMh1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fhu+EMh1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF89C4CEE7;
	Tue,  4 Mar 2025 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741102555;
	bh=SEwtxkr82AoCWr4JQqdNtQ1RgcxKJ0Fknk+gclPMdr4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fhu+EMh1F5hmlQjYRJQVtBOzVSNTbbqcIjpm8uBdFNYkijLYOIwRL1S+bl0LoFaCn
	 sFCGDdUc4jjVAvF7Aqs/ja58fa4XPcz4Ke38yWZsSpNPVm2WQa8m6Zc+WNv3ifvAX3
	 zElVf0asaopJXq025BdTSmUKaMlOB+qB21LKNLJTFrA9PvDNEnQankiuEw028BWx+z
	 ITMQjWaT3s5t5fabEBLqf3G0SIXChDY8qIGnjuhWS+gpkZ7TGk8Q92LjDrnFRIKKCP
	 YPqAIAwzDnExsut1wTz3pB6iqaoW/PkGxYCvQmYSAeVOTKujS+FCUtQqjv5w8g2gNk
	 R4jSoaIviPxDw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 000/157] ASoC: use inclusive language for
 SND_SOC_DAIFMT_CBx_CFx
Message-Id: <174110255498.87345.16803707910385951760.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 15:35:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 26 Feb 2025 01:29:29 +0000, Kuninori Morimoto wrote:
> We have both
> 
> 	(A) SND_SOC_DAIFMT_CB{M/S}_CF{M/S} : Master/Slave.
> 	(B) SND_SOC_DAIFMT_CB{P/C}_CF{P/S} : Provider/Consumer
> 
> We should use (B), and want to remove (A). This patch-set do it.
> It is based on latest asoc/for-6.15 branch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[001/157] ASoC: Documentation: Codec to Codec: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 8450fa6b16e2f46f5b880e0b80d55ab9fc4524ca
[002/157] ASoC: ti: n810: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 231bf041d425a086ec08231c98cf02b6fb16b169
[003/157] ASoC: ti: osk5912: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: dfdc0debf1b82354e301843f8cbd16eaf05a01c6
[004/157] ASoC: ti: ams-delta: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 48d5e50e4fe78bf9cc5b4eca72798d4507da62fb
[005/157] ASoC: ti: j721e-evm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 5cfb2f62242b41e2b60cadf21b28ee43cf615ec2
[006/157] ASoC: ti: davinci-evm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: bc17eaf1b925595fb9f945ced5d70fe82ce11e78
[007/157] ASoC: ti: omap-twl4030: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 9fde82ea39a7f52c23de366c8592d4805634f45c
[008/157] ASoC: ti: omap3pandora: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 941abe67e176a3ddbe59cd4323b13f69515f6628
[009/157] ASoC: amd: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: df95f0157ba1ea7b73b3f1db4abfdb4b05e0bfd9
[010/157] ASoC: fsl: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 2920be2fabcb8010fefdf101d84fe0867730d925
[011/157] ASoC: mxs: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 74f6e045d879414ae4c352dc7f4e8d438ea9d55d
[012/157] ASoC: pxa: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e42ec97657fa5ee40fd2358c973d273edd7999bd
[013/157] ASoC: qcom: sc7180: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: a1cadae42c9bc52cff24b22b0c4986be8d82ae16
[014/157] ASoC: qcom: sc7280: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: f8ca280bf5c2a3fb08890bdd212a3f3c00589f87
[015/157] ASoC: codec: cs4234: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 3c2e63a3a0efa8c52f9fd67f58a71af48957ca7a
[016/157] ASoC: codec: cs4265: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: c974655b0c7f82a760bd22d9ef9db281e765a9a2
[017/157] ASoC: codec: cs4270: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 46dbe25747fca3d82e98dca488fa9be6b809d522
[018/157] ASoC: codec: cs4271: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e9ab4b38205a34fffe537b4db721458b5d07066e
[019/157] ASoC: codec: cs4341: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 0d41068ca151a6368ab4591c13e9a7a9fb92a56f
[020/157] ASoC: codec: cs530x: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 0c57e55719681412e87db7bb81b8255b43d6162f
[021/157] ASoC: codec: cs35l32: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b26c604a0dcef62e7c61bd1d560c63547c9bbfe8
[022/157] ASoC: codec: cs35l33: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: ea38f63c4afdd5531fbd8f0f881594a94c4bd413
[023/157] ASoC: codec: cs35l34: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: d21e3b442ff6401511831ae1b8be11d530f063de
[024/157] ASoC: codec: cs42l42: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 952b334dcfcf641a6290b876bdc226c23772287e
[025/157] ASoC: codec: cs42l51: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: fad200733e5026b103ec2504ad3dfc2843216cc8
[026/157] ASoC: codec: cs42l52: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 1ef8b1c830a0b5a6600d803a8bbeb7179d3ca4da
[027/157] ASoC: codec: cs42l56: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b9dde447dd27f1b3ca21e07da1d885fd342cfa62
[028/157] ASoC: codec: cs42l73: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 8f5ae83953335d9c4c8d1cb698b87cea1ac8aeca
[029/157] ASoC: codec: cs42xx8: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 90fd7bb1af1733685f0aece12dd7264d4ef68422
[030/157] ASoC: codec: cs43130: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: dc946ef548aeeea258b040087b88c9b7fae5cb6d
[031/157] ASoC: codec: cs53l30: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e759aeeb1d09147891e08682df3a70dfbd15724a
[032/157] ASoC: codec: da7210: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b50e5b9694e2a4355f2abeaa711dae5190661c27
[033/157] ASoC: codec: da7218: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 7177a7a8e10d7722d0b9d4be4eea7dde014527b9
[034/157] ASoC: codec: da7219: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: fc0a8ee9921f50ac23b3264846720d1d15be539e
[035/157] ASoC: codec: da732x: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e5f0c2ad987b494ab94bcb1331667d189249f234
[036/157] ASoC: codec: da9055: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 6f8ac982806a104e4e816e12279d85440b6f703f
[037/157] ASoC: codec: nau8540: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 739f4f44dc42b866090297adc1f007ffcdefb602
[038/157] ASoC: codec: nau8810: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: a3c86259f8a402aa050fc5f3039f94c7872e4657
[039/157] ASoC: codec: nau8822: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 1fca457c22a277ba47ae1bdd2a09d42926a5beed
[040/157] ASoC: codec: nau8824: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e23d68d7d3b35a44eb83d834b65cd28ca08844ec
[041/157] ASoC: codec: nau8825: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 2f120ee8026ab9630dc7f93dd4bafdcd56c82056
[042/157] ASoC: codec: rk817: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 5f2d29942c82d229dbdafe4bd21585d1b67f31ee
[043/157] ASoC: codec: rt274: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 9c7cf29bdb11cfdd1b59d1ea1eb852245b26e93a
[044/157] ASoC: codec: rt286: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: a212edb16ca0698c488c6adfa6854224666c8cc1
[045/157] ASoC: codec: rt298: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 84f32702f3efe02c2622b9151d4e08c436249a8c
[046/157] ASoC: codec: rt1011: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b865e0823cbffb747173b7dd4f4c8d82491d111f
[047/157] ASoC: codec: rt1015: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 2281565db79b5fd6b539e73a28e73fc960ee34d4
[048/157] ASoC: codec: rt1016: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: f9ef0947ba848467e4dcca6b5ab3a4ff2e218df6
[049/157] ASoC: codec: rt1305: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 9261d67d8bd2d9e787ceee8ff593f105bb3f5176
[050/157] ASoC: codec: rt1308: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 668db717850296122fa0e2aff471cd20a722e0c5
[051/157] ASoC: codec: rt5616: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 2d5e9d40998b441485376b8729c69073d8f2ab9d
[052/157] ASoC: codec: rt5631: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 1b16920e651d11811ca4b3a5d92cfb3d817b1a14
[053/157] ASoC: codec: rt5640: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 60143172c63daa49fef6eb9daa066fb7f1360bbe
[054/157] ASoC: codec: rt5645: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 3165df2f130d567e6cf05d789ecc28810519e5f7
[055/157] ASoC: codec: rt5651: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e41ebb0a1f8bff63c8e333eec34ff64e748227d0
[056/157] ASoC: codec: rt5659: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: f1205656ef2334e860ced588e76dd88119394166
[057/157] ASoC: codec: rt5660: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 67f2243f2b1f1936c4dc22897289f5815a0e224a
[058/157] ASoC: codec: rt5663: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 0ad3a7d311f0e93f2e838b4e47a7da57c501d737
[059/157] ASoC: codec: rt5665: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 0b74ed5533c87db1abe3967e3a370bc3046892c7
[060/157] ASoC: codec: rt5668: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 4869417f4a2b010e9ee00f611265f551a47e4f1a
[061/157] ASoC: codec: rt5670: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b3a3eda6cb30f21b818f40795468ff0a9f629990
[062/157] ASoC: codec: rt5677: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 40213f8d5b498f5eb2f3297ee0f9c84d98737ee9
[063/157] ASoC: codec: rt5682: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: f61c11db0f598eed6dd35a2d700ca54c6c74af4a
[064/157] ASoC: codec: rt5682s: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: bd178280c7d967e87e217b51c0647a2bfdf5deec
[065/157] ASoC: codec: wm2200: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 461deb4911f39e455756cbc42928b12b04e82851
[066/157] ASoC: codec: wm5100: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 4042bb6e973aded1de6ce83436804a90181d6357
[067/157] ASoC: codec: wm8350: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 474cd6355413b264087ddc66b1dbc6c7e59fb76f
[068/157] ASoC: codec: wm8400: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 24684cc2060150afd7a1ea47c586f9c09330633c
[069/157] ASoC: codec: wm8510: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 420663ae8fa2d70d2b824848763ca15bb5b2b585
[070/157] ASoC: codec: wm8523: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e2bcc61a4481c3de4747014895cef45d701956bf
[071/157] ASoC: codec: wm8524: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: dee14c5b6d29886255c4a54599590d49fc1754be
[072/157] ASoC: codec: wm8580: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 1b94f3874d61b34febd5ddf3482a90107dc80082
[073/157] ASoC: codec: wm8711: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 042ecb2ab2361f77b34a7d3c642bd378f6ecc73a
[074/157] ASoC: codec: wm8728: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 4d20a35acef6fb8c42eff953a11759e94710ba8b
[075/157] ASoC: codec: wm8737: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: bb0b8a07192d86b291c5b13fb64ef984930f8ea6
[076/157] ASoC: codec: wm8741: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: a018b6601c47e7d989f1fe5c175325f85dceb264
[077/157] ASoC: codec: wm8750: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 4be54b6bdafad7656fd85c1fa6b7bebb7700a3d2
[078/157] ASoC: codec: wm8753: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 92acd9f7409d2939e5fef8bde5ad527b9e525229
[079/157] ASoC: codec: wm8770: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: d17b39f6d3e635b039314726fbc66dcef286ed79
[080/157] ASoC: codec: wm8776: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 9b9cbc6b4fa312d963f4373e88b6e27106f2051a
[081/157] ASoC: codec: wm8804: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: ad3993c449637fcec1e05bd2b63c24d34cb82243
[082/157] ASoC: codec: wm8900: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 2f8b07842e9e95122b848727ea73504a035e7c12
[083/157] ASoC: codec: wm8903: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 1a126668ab0946ebb7d1450742cd14775aa298fa
[084/157] ASoC: codec: wm8904: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 25baeacd9c6307830e2ed9f586f81fc23d4d1002
[085/157] ASoC: codec: wm8940: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 2d2223d742d968fec77ed056db9f158e7cb3ca94
[086/157] ASoC: codec: wm8955: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: fb44bd4902cd5df526ad432015edcfaf163999e2
[087/157] ASoC: codec: wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 541e0b4947a92f4bf1d60ef7e55f0a254d9c41a0
[088/157] ASoC: codec: wm8961: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b99c850bd41e8f6f142bb24c3c2485043b552621
[089/157] ASoC: codec: wm8962: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: c6472392301fc15a09d5435f1f89421270aed81c
[090/157] ASoC: codec: wm8971: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: ed86f7b7e5f676c24ba0ddd86de6614a4b69a9e4
[091/157] ASoC: codec: wm8974: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 68084db5e7a5eb1e4901e2158565cfc59873756d
[092/157] ASoC: codec: wm8978: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: f0bd6cb02505eca6adbe2e3ad3445a2420637c19
[093/157] ASoC: codec: wm8983: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 93b1fefd8b1a004c6c8f8c92085e7bfb694dfe98
[094/157] ASoC: codec: wm8985: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 7f3ed7ea52f21d5b8ecc01a17fb8f7209d337cbe
[095/157] ASoC: codec: wm8988: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 2725c018785d52286dd5b4ff7e087d2ff455a1a8
[096/157] ASoC: codec: wm8990: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: d542f5bfa3e4e16aac6141abdd44bb8a2a6f0761
[097/157] ASoC: codec: wm8991: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 0d4291fa3a8945d97d26a6bac8a4068f116f2885
[098/157] ASoC: codec: wm8993: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 291b4eb984792fcc0bd3dec9ad9a69c3c6988951
[099/157] ASoC: codec: wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 35492f84fbd6d790ad7f93bffaaa6823890c103a
[100/157] ASoC: codec: wm8995: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: c417a7cf976eb8ecd8ebca439ec0cb0fe9ddc7ec
[101/157] ASoC: codec: wm8996: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: cc49a35ab19565c5eaef070755b6fba235f9d05a
[102/157] ASoC: codec: wm9081: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: cfb91be8f9c8e54e517a9a539012309101abcac5
[103/157] ASoC: codec: wm9713: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 9c914ef3b876a6f6c0059b4f4323fc1b76fa05e4
[104/157] ASoC: codec: madera: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 74da545ec6a8b41de96b4c350bb59dfe45c0d822
[105/157] ASoC: codec: arizona: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 1af0148c3f871e55a6c4adf544af77a19fd17671
[106/157] ASoC: codec: twl4030: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: c80956630fa077646f971ff5d3e9452339742def
[107/157] ASoC: codec: src4xxx: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 27f5e88fdc8ab577dbff389085ae6ad41e994ae7
[108/157] ASoC: codec: sgtl5000: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 6575dd53217ee5686d48a35f48415b113518d2a9
[109/157] ASoC: codec: lochnagar-sc: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 6dd61011a67e35b8d5f3b94193ed66d0c19ba425
[110/157] ASoC: ux500: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 521c04c6e32ac110d942fa0e11bea4b91cc3241d
[111/157] ASoC: meson: t9015: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 6cc4d2c11537d66e9d4a7356a576f1bea6f4009f
[112/157] ASoC: meson: meson-card-utils: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 4586b056956995754e95456312b2a9ce36c8de21
[113/157] ASoC: tegra: tegra_asoc_machine: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 04ea3e0d2e10642f0a0199081e9aa8fd5e1bbea6
[114/157] ASoC: tegra: tegra_wm8903: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b15ea10972a1b4db23f7495003fccc6fe59e44bd
[115/157] ASoC: intel: rt274: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 836d2924c05edb06e32eeede8bc12c4c96da0b3d
[116/157] ASoC: intel: rt286: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: ccf2a77a5d1504ca95c1ae5f37ed184e62dcd2f2
[117/157] ASoC: intel: rt298: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: f5617b647c8597e2437b3899f520fdf65e0f277a
[118/157] ASoC: intel: rt5514: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 6d41096d7df609992479d6a3a43bc60e21b8e165
[119/157] ASoC: intel: da7219: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e15abfa60107f97fd8297faad8cc3dc4eae0b5cc
[120/157] ASoC: intel: ssm4567: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 0808c1ab8d1a1222194d830870f6b2b47220b1d7
[121/157] ASoC: intel: nau8825: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 4994da5c7fea1ede9b71ae66e3b906ea56b9a929
[122/157] ASoC: intel: max98927: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: bcb896a69864aec4dd0251732a380bcdbeff8c51
[123/157] ASoC: intel: max98357a: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: d2f277bf8aaed8c5307ab998b2de4346bed6e884
[124/157] ASoC: samsung: snow: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 69e35d9bfd6ba2837fe18bebf97ea747ceb110d5
[125/157] ASoC: samsung: bells: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 5dc6b4a351de9804932c4475a2c73c22c0b59369
[126/157] ASoC: samsung: odroid: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 06d07a4f5b98c71c696fa8f8718050b656ab99ba
[127/157] ASoC: samsung: arndale: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 3f97e52562dd1ad041f63c910a746eab695f40c1
[128/157] ASoC: samsung: lowland: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 9ef6a439bc987753b7e5af5a926f05debe82bd1c
[129/157] ASoC: samsung: speyside: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 3d5f026256d985e8b81e7657a5430a9ff14e651c
[130/157] ASoC: samsung: tobermory: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 29664312a75e47f989ad32e43682746d8681a02b
[131/157] ASoC: samsung: tm2_wm5110: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 1455b3857ca2d05966005f7172210f6bd00048c3
[132/157] ASoC: samsung: littlemill: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 2c4a2b5d084b06e1a9fd2e85866b51f6118dd254
[133/157] ASoC: samsung: smdk_wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 795aad6b179de4c3f68b18132bd183931d09c462
[134/157] ASoC: samsung: aries_wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 697c58941c0a0d1a5ea3f323cf0231018d3ec4b3
[135/157] ASoC: samsung: midas_wm1811: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 22bbcab0a2a100827a26833b7cab16ae8b1a3f9e
[136/157] ASoC: samsung: smdk_wm8994pcm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: cc8e22b6b1622f44654a9ce70c1285c15c1b8414
[137/157] ASoC: mediatek: mt2701-wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 862123a0a41647bd130a2d0edefc76a52dc8b8f8
[138/157] ASoC: mediatek: mt2701-cs42448: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b1f5886cca25a6957b5541031376e2c06c5bd621
[139/157] ASoC: mediatek: mt7986-wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: c709a876b7de676d49b00b624b37d208e452cc7e
[140/157] ASoC: mediatek: mt7986-dai-etdm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: d8c808af2a9bf731f72fcb772cf22886c6d00d99
[141/157] ASoC: mediatek: mt8173-rt5650: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: eeb25b3ca1ef57d57906295d829febbd30cf4d8d
[142/157] ASoC: mediatek: mt8173-max98090: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 47c59833c42a99bd27826f4f369bf4bb433c7ff9
[143/157] ASoC: mediatek: mt8173-rt5650-rt5676: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: b73c2719c951868efc15181269a3caeb99157f29
[144/157] ASoC: mediatek: mt8173-rt5650-rt5514: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 522f5021cfb5a74e9b7aa3cbf365471f7a564c0a
[145/157] ASoC: mediatek: mt8183-da7219-max98357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 711035c043b3a5116860b3a25d808572f70e1dc1
[146/157] ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: e33d0569d7a1d041e37fb93094e70807856531c2
[147/157] ASoC: mediatek: mt8186-mt6366: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 38cc5b0bed6c57367dca3725d01857fa0876899a
[148/157] ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: d4ee06219f2fffb71e2a23fc5060fdd3c7bb2cf7
[149/157] ASoC: mediatek: mt8195-mt6359: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: cb1ebf6e20371208c49d59615bf4b46d92991fc4
[150/157] ASoC: mediatek: mt8365-mt6357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: db9912ce99c346c948c8fa774c0afc7d80d0ec20
[151/157] ASoC: mediatek: mt8365-dai-i2s: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 9002421ebb1409e2f47062722aad598b561cf9eb
[152/157] ASoC: mediatek: mt8365-dai-pcm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 0526b0b88c3092e38ba2d05f480b66bd5a1e1004
[153/157] ASoC: rockchip: rk3288_hdmi_analog: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 99239dc5147ea4678e871e5c9d068a36f154558b
[154/157] ASoC: rockchip: rk3399_gru_sound: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 8410a099c88d1d720c9780b0ed716e544ea5a6d2
[155/157] ASoC: rockchip: rockchip_max98090: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: edca7ad57c50483ec81ab5b74ff1d71dca62e5cb
[156/157] ASoC: rockchip: rockchip_rt5645: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
          commit: 7370a8fe5bd211042610ec200dcc83de5ccc50cd
[157/157] ASoC: soc-dai: remove SND_SOC_DAIFMT_CB{MS}_CF{MS}
          commit: 0f68f56ab7be101fc949177774107769e63f13e9

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

