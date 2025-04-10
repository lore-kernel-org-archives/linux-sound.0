Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31514267F7E
	for <linux-sound@vger.kernel.org>; Thu, 10 Apr 2025 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744284215; cv=pass; b=NHHhHFQfOoFhqwjcCzFCE31NbZ7LZHVNROR4iJt+RfqTzWXXrkn3OFxFtyLYugkGiPxHNoDuffCflGFOYLg6evOCAnW1TO0tx6FFBUfujh/cwp0PM5Z8HlkN6/vKLHhOkt01/2dyrO/WuNQiZPYlXAbr45Ay9CS8YY0QmVRcmkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744284215; c=relaxed/simple;
	bh=ru8hNJ1Ae00TI3EGmjbuaeL0RmA1Mb1L5jLsF9OnqQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jpjXIsa1YSLoeXjPI2X0uZ/P311543t+uH7jbJe3Yb2dDBx+K8ypYC9mRuYNZ/t6kCCS3ywFQuLwB05ctsozDWWYX4f3vztjZ26PembqT6Gh/OExpGI6hqH6FCEjiYM1P1cJVqnASu3clEpUsC3AWRED1ToJxCnml+orRv3++Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=CWL1nxWx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="CWL1nxWx"
ARC-Seal: i=1; a=rsa-sha256; t=1744284206; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bs5LHIxjuVvwvXNrDW+NZzEHTbCUgqph/t+6MPqe/mw8Tz6fFvGWz28yGTh93ux6Xh5/4bFbiyQ2NZZKghV6H8rN9CotNGg0RoSkHRVQCa2F0h4QTpgExDNqg+nYeQUPo6RD+c/L1hlYyI0Nnr8UuqGoR3FW0oBN7KyBdnf1djs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744284206; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jro4fS3zrdKQkRbp91VBffkGxnm3V9yL6nTV9hy7aWQ=; 
	b=PTfH54v2gZBwsdTCnWFflu1aXtJHNKskuXDxejnuoS3Gj7AK/IALcZjRpHf3xh/gQvZg7IpGOya1qEkYGFBghQQVJ9JH+2XMluJ8IxKm6CXllxKvNo6ShIZ5vDIoFW5JquKbDZMZu+6e2Q+9OIo0ZBFSQTyCi++TVd2yQIZDvPs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744284206;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=jro4fS3zrdKQkRbp91VBffkGxnm3V9yL6nTV9hy7aWQ=;
	b=CWL1nxWxyV/sb9FrDzvqq+IU0Ycuyg6xprT5qsUfr8lspc0cVkL4R42X2B/MVlm9
	ndN/sO2I/8xIiFdOJ/gesbhttdX9KmCf3QMEPRgMAhUWZfLaTANMZsi4AHiSAgXcYpW
	Rz9m+nD4niYaR80c8jsmTlA9Q+9aVPdEjE8FhPRE=
Received: by mx.zohomail.com with SMTPS id 1744284205497511.0629306184205;
	Thu, 10 Apr 2025 04:23:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: Debugging CPU-side DAI hardware with a dummy codec
Date: Thu, 10 Apr 2025 13:23:21 +0200
Message-ID: <5347100.LvFx2qVVIh@workhorse>
In-Reply-To:
 <CAEnQRZD4xw5wRR6exsXo9xjTmmQ1TQAn0jNVeXij66-veEESMw@mail.gmail.com>
References:
 <4927043.LvFx2qVVIh@workhorse>
 <e649be07-108a-4f7c-9471-74b74a4f73ad@sirena.org.uk>
 <CAEnQRZD4xw5wRR6exsXo9xjTmmQ1TQAn0jNVeXij66-veEESMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 10 April 2025 12:54:16 Central European Summer Time Daniel Baluta wrote:
> > > I hope someone can shed some light on this, as it seems like something audio
> > > controller developers would be doing all the time.
> >
> > I suspect most people test with an actual system.  A bunch of things get
> > easier if you can actually play and record sound.
> 
> Mark, that's true in most of the cases. But for silicon IP
> pre-validation using emulation
> environments most of the SoC creators use a synthetic codec so things like being
> able to probe a dummy-codec does make some sense.
> 
> Nicolas,
> 
> Can you please paste your patches (dts and the rest)?
> 
> thanks,
> Daniel.
> 

Hi Daniel,

I'll send the test-component changes in a proper patch submission later.

The DTS in my case looks like this though. `sai0` here is the SoC-side
audio interface. Don't worry about the pinctrl/dma overriding, that's
me disabling capture.

---
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index de63b053a06c..6e78713b1a99 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -84,6 +84,25 @@ simple-audio-card,codec {
 		};
 	};
 
+	dummy_codec: dummy-codec {
+		compatible = "test-codec-verbose";
+		dai-tdm-slot-num = <8>;
+		dai-tdm-slot-width = <16>;
+		#sound-dai-cells = <0>;
+
+		port {
+			codec_endpoint: endpoint {
+				remote-endpoint = <&sai0_endpoint>;
+			};
+		};
+	};
+
+	dummy_sound: dummy-sound {
+		compatible = "audio-graph-card";
+		label = "Dumdum";
+		dais = <&sai0_p0>;
+	};
+
 	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_12v0_dcin";
@@ -708,6 +727,26 @@ led_rgb_g: led-green-en {
 	};
 };
 
+&sai0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sai0m1_lrck
+			&sai0m1_sclk
+			&sai0m1_sdo0>;
+	dmas = <&dmac0 0>;
+	dma-names = "tx";
+	status = "okay";
+
+	sai0_p0: port {
+		sai0_endpoint: endpoint {
+			dai-format = "i2s";
+			dai-tdm-slot-num = <8>;
+			dai-tdm-slot-width = <16>;
+			mclk-fs = <256>;
+			remote-endpoint = <&codec_endpoint>;
+		};
+	};
+};
+
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sai1m0_lrck
---

NB. that this is based on my local v2 of the RK3576 SAI series so trying
to apply this with any tooling makes no sense, the main takeaway should be
the audio-graph-card and how the nodes reference each other.

The dummy_codec and dummy_sound nodes are children of the root node
`/ { /* ... */ };` here, the sai0 reference comes from the SoC's dtsi.

Kernel needs to be compiled with CONFIG_SND_TEST_COMPONENT of course if you
want the test components.

Cheers,
Nicolas Frattaroli


