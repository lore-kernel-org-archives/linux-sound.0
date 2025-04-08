Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75D21EB3D
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142302; cv=pass; b=GFOMYUnXZT0IE3oFt8LliRPhv9sggu/cNGHab56ppXKHPntTC6aCKa7dHmY3gDMt8gKvc/w8p4AFqwDsVYnIGAvcqk2zMKwR29k1IPwt93hGhxQ7qsadwQOyO7Rx3MxOnt96d15dbT3ZDUaABrM0V04I74q7nqviFTakeP1+bw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142302; c=relaxed/simple;
	bh=QYX3pPe/XcgJR6hOlYENbsVL1WWxBY612hmOMtg0928=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lkZmT3Tun67aNWcbqTnZDlVI5kebLJuT6TRoc1tR8t7rlD5VLgQ4gFWaRYy+g6nehCOziMZb8umElA4e1mkIZzqpjAoII24rqAv22Nwnxg53Ke37ImUxLOMfacQy62QglCaH0DFTopFlseKV4et36n0r1D7MXpHglsJjNCNLqF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=NSNmWyrz; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="NSNmWyrz"
ARC-Seal: i=1; a=rsa-sha256; t=1744142292; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jkcbVKwmkGEURwoNfnsEUMVVJ/SntZTPaVm4yWTvzXfbItPT1jnHk4/e4K/P2YOSSoZXLx8gyQybLdFyr9CN6xCUk8BMfNr7NoPBZ1wpkzBC0Yx4Ca54fAp5WcnkC2ukwOJJ9yUw4cRkPUdgMv67d9haPve7Yv8FNo7CbnLRa3s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744142292; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MIYWNh35g7uf40LKt5qhy8i5Je61iqPpdup6uDpk6PY=; 
	b=JXUJia0GO8ofAi77KXVRS/c7cHTgCQbasRjj6xyY1Ob8fYBZu253B5bZRueDCucSHV4q+y4zwVHQkEKHF/XGkSl/SLLpnQbi3QAwgobO3SyOix4oYXTQ6I7pfWrCQvpUF840xh3OLUPiEO/18pvclvFp4fg6/WcRkToeLDaiZJs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744142292;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=MIYWNh35g7uf40LKt5qhy8i5Je61iqPpdup6uDpk6PY=;
	b=NSNmWyrze5tlz27bszm0zs6RJE3x7L8MUtzc375P1Mp5VaCojyuE6R9XTpbb0fgU
	K4JmhHUMIQshpAXsKf0TR+9ovjljcTs9fYcA7hEaZeBCuLdjE65hAyEKP3KWIf98dmi
	CIRqrp5W2vNX5Wb62ePRjvpdYXLk+QOEQdq/+q6w=
Received: by mx.zohomail.com with SMTPS id 174414229156269.81637036817824;
	Tue, 8 Apr 2025 12:58:11 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Debugging CPU-side DAI hardware with a dummy codec
Date: Tue, 08 Apr 2025 21:58:07 +0200
Message-ID: <4927043.LvFx2qVVIh@workhorse>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

I'm currently working on a CPU-side audio controller. In the process of that, 
I'd like to probe the actual I2S/TDM signal coming out of the thing with a logic 
analyzer, with no codec connected at all.

So I add a codec to my device tree:

	dummy_codec: dummy-codec {
		compatible = "please-replace-me";
		/* these might not get picked up, whatever, bear with me */
		assigned-clocks = <&cru CLK_SAI0_MCLKOUT_TO_IO>;
		assigned-clock-rates = <12288000>;
		#sound-dai-cells = <0>;
	};

and reference it in a simple-audio-card:

	dummy_thicc_sound: dummy-thicc-sound {
		compatible = "simple-audio-card";
		simple-audio-card,name = "Dumdum";
		simple-audio-card,format = "i2s";
		simple-audio-card,mclk-fs = <256>;

		simple-audio-card,cpu {
			sound-dai = <&sai0>;
			dai-tdm-slot-num = <4>;
			dai-tdm-slot-width = <16>;
		};

		simple-audio-card,codec {
			sound-dai = <&dummy_codec>;
		};
	};

The thought here is to let the probe defer, and just manually bind the driver.

So I set a driver override on my dummy-codec node:

  # echo "snd-soc-dummy" > /sys/bus/platform/devices/dummy-codec/driver_override

And hope to now be able to bind the snd-soc-dummy driver on the faux bus to it:

  # echo "dummy-codec" > /sys/bus/faux/drivers/faux_driver/snd-soc-dummy/driver/bind
  -bash: echo: write error: No such device

Clearly, that doesn't work.

I know there's no DT compatible because it'd be abused by lazy vendors to avoid
writing proper codec drivers, but I'm really genuinely trying to just look at
the signals of the DAI here and there is no codec whatsoever.

Apparently I'm the first to ever try and do this because both my mailing list
searches and documentation greps came up empty.

I hope someone can shed some light on this, as it seems like something audio
controller developers would be doing all the time.

Kind regards,
Nicolas Frattaroli


