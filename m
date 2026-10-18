Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286DE3FF1AC
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302962; cv=none; b=lNxgH9yAY5Oil4u2j0Ipx044CUWgVh0PhQS8K76BTwYd+b/Z3XmwP4U4QPQWH7k2+oYaDTVLXYfPGG9+X/CWfZ+vntYoCixvcTYusyplImr//LWJxnG7aiwd5Bg9QPlfZXe/P2tm1Yk1emKnHxHDirD2LE9zF/ezN0YsLOnzJXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302962; c=relaxed/simple;
	bh=KU3BimG1w/tGdivUHCFc4QDicVE1ue8ULpff7ZYuYZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/r+ep6Rn+6hSnmz4jA2UdoyXD/g3PG8ci1eL959CIMMjnaKTX+0vdx1Pk3l0SJ5AvsgyEfWyuPXC/VOmdemcnhryCYn4flskX3/Vlq02K1sI9vSyWnycnEd0onu6Tq5nxI0Mauy8BmO0Qx+F2Va53D305VhB+TQYhI+d6BpSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T383jBsw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T383jBsw"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1099100a91.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302960; x=1792907760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=T383jBsw0VBBZgdkYYREWsHHOWepocZ+YzmWz10xe9DLoilx4quKm3D5xjgzzwr4ju
         o97+o4zSqLwUUG773qoFVmDSmLAWQHIN2xTip7IcK9eJtTF6ivpG36RNdVksnnbqmXzz
         pPeVPVGR3ydke95O5eGMzxpY5zGQFd5zfl5aOb02RMtAnwaiOQ7spuxOIa+nPrRpH+R3
         fAevyoNiof7UsaGRjRcjj226FRi+jqOivnQjWc+qCuFv0miOH4r7sUBNBHPmDqzDiGPp
         cxUW+50ztGfDk2fz2T9+ja8PtPzgWdFMX2axQ1KxLbIu2DJ0mCzP1uNnpzqFsh4sMebz
         0fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302960; x=1792907760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hF4JMWs272sSEGsqzXfRRdeL0HGexoAGbLW26/BzJH4=;
        b=z6k41t3oSptoZlADkhMR4Uub9D/1YEKR8gDzRUlzly7Z7qZFywXsO4/GDOKjPvhAA8
         vEEV4Xu8CEnEXVFsVhEG4T6z/1gn1ifzR3L+STVisbvVET+jbEGNsJkAzDGpamj1sTlN
         J9zzmo9TVFpgzJ6Dvb86D5obCJrfGHzG2kkjQZh8XlRIesov5d9gOfqxDcDayw4OvwpJ
         J8gRdr/1y/F3xwqmO9ylpFxDp6KT39wkWhhl1FvK0J7n1bODJkkwaFc7dV/C7StTZnha
         y2+7TyhUih7otbhCsTRXhWa3eH6ejlk98pcNA8C97DYunUTKzk/h6P2EKAHXsLCPB3J4
         nQaw==
X-Forwarded-Encrypted: i=1; AKwUvBzd/P9c2jgoHi08Q2b2yUaXrSGtRuTKZrIJEtrOs/2xu7bPGagrHkPZKMKYvwZ46JA6IG/ziU7gx//w9Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIF8guDFUYMcOtvsfhBSw/mbg8qDpOyQsAsAdP7IvTdGgPozTTI
	YcK7tCKMVZeAJ0mDF985yfujz12gCGHOYbNBItn0ovJUGUsUbyKeUYtT
X-Gm-Gg: AYBFou1qd+qVz4lQlgUTJ1AL+Jfl1N4NxQlZcpdUxsIMqtDbvLVM1ouhWAUePofiIKP
	syhkGR8wLeIiWFh2nWpQ9p/WuhafZkc9qdvorFHJeTaZrcrGp3x8INjlyd2PsKmqUc+5bxinlo/
	uhGtTxYkMZFlnlWnqaqLOyv3KNyPLC4e9vxPxSf5WYZ+16kOIoYgJpRaXQ79nr4YUrA0TDmL0ep
	clHc+HK4Jkrq5Aghe28alJUEuglman6cwikUuFzDUNiDuU1l3vEsCZwf2PhG9SYqV0cZfTSCQ1Y
	FSXPVc/Ozvxfk60P9gjeMcuNrJEKBJMa+k4QY9p02KPR9USxEnIuBgj6DIBsPQD2YqqnvH9TrPu
	HqjUaWjgw+2RDJ8jG03CX437UHpojkQ+DqYdDqsXTPZ9hvpU+XBQYON4qgeabn8xOArhPz2e6cY
	3pvT20ud/wLrHG+d6or+Oi1v3Nh3n0Gapwl0TgoTbTFkOXu3H4aWPfcsAut96NBaHwEJrVvWbVN
	sfEaTtTvRegIZavcBZK9f2WePzVsVCprQlzVZ9DryW0gp7oFJETipMeerbVuwr2L028hY32wdL/
	/MByeE3am6htFQNc3cUMVnYl96DStQqwUbgPkLFpzlPJ3w==
X-Received: by 2002:a17:90b:5643:b0:3ac:95d7:2f9e with SMTP id 98e67ed59e1d1-3acef4e492fmr3874379a91.38.1792302960536;
        Sat, 17 Oct 2026 22:56:00 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:03 +1000
Subject: [PATCH v3 09/21] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-9-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KU3BimG1w/tGdivUHCFc4QDicVE1ue8ULpff7ZYuYZc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nkOfZBinBN/YGlX0O5SvnfvnwlviQh5vf3pG8Wow
 u1aYrPYOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtH8vwV0hFKrt3PdNppgyXZRkNSyQVK5OOKKUtnDtdWvvKqVv31RgZnvPLX/9
 g9pT3TfXN1ROaHBufK3Ku+GX6Y3bd+yu27Cw5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..7483fc5cbd20 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0

