Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D019643147
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765566732; cv=none; b=DhX1B1TwYNx2JxzQOkVP0J1iRhHmLaBIudlYF0zK8C9KXLCRZ3DFzg6Z+QpkVgYLTgKaTMOJ1jTkz3hZBUAca3VJsTYU4tvZ0DmuubN6o838QciFmp7S3t/piLwp/sKGvGTAobb1tknALWisYuIsS1ydtaY9trdQDOuNbaCN8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765566732; c=relaxed/simple;
	bh=JSKXSfuWmth0e3j5V0Pbds3rdE7zZeYH/sK5ejXFogo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RTpJ8sWiG6gWdKWplXOvNXZoztYztB5tr6XGcFfkUx/LCMz0rOAPIQsDoP6LKNPgIIpKbx2X9TZ7tkE0F/EMSmpP0iZnPFvInUdMNy6tQz/admJdrraWUgQB07o4HfNyPZ01Z2Z1IRGUHtj0mF3CcBEvhGws78SMRpGAL+iPoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6aP04cP; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6aP04cP"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso13469431fa.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 11:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765566729; x=1766171529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ukvRgMINo4cgRsNKCNTMLrsVB8Bgy8vz4JhLYrjNDk0=;
        b=F6aP04cPjIjmHlPKJhaZMuAWH8mS+isgeLMB6SXie4z3J3hlOL86egRbhdLUCnWNt0
         3KAWGTXT9sz/N///qp060JgGnyUXJOqZsws64nJir0BPpjNjX5pjiGO4bMVeRWYjqVTD
         Hdy/XLevK/X6ZsWi+Sne8ivJexIZcLd/Zlc2W0B+dREb1Vh29HNBhc3ifFuGC9rrgWcO
         NpB7kqQWnNRkqSQ/mmQmDaThSAGN4TtsQSXYqOSjKxKAZkailm1KL+xMlWmE61geR7CR
         KRIEtBhBSWYv8RN7HVNRsegeEIAG3vx6+FGBDx72EdVvS0kPojTEvooYgf1tMm8HNI44
         o0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566729; x=1766171529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukvRgMINo4cgRsNKCNTMLrsVB8Bgy8vz4JhLYrjNDk0=;
        b=D+HWh8w5aLxapZITvlItNuNX9cICBrMFYKGeURamMw4YqoOpclxwbngb0+6rv/aC7p
         wC5mkww7+8ARqsk4PYEa/kFQYZVgj8/ufOq+xJxsnSGDVrSLXCah52DRF/szQhU3r0yT
         3PaSkfG6NeuDDH1uUsaT5jBoUQ4gQKwh56yE/fQCKszj+GB1PI47g2EVZfo2EPUJmW4f
         EPeQv6ayQwwgdqQdNrw0pkQ12LYW1X9J6WeZwVpeErLWSwDcZJa0ZrChvMuN0ZN70ngr
         HegvYmOXFGuzNXT5Fx/4IsI3XT2i3TJocAyO/AU9QVePz+pEIwEEtj00c3pJO47FU3fN
         ePZA==
X-Gm-Message-State: AOJu0Yy8HPwxk8//G62SphFDldYEEN7KOeQ+q7nsmTEj5Bb9Ez7B5Otz
	Fm6vvGNDhkrrkKS7i5GN9I0DQnqiD8KQXo59Hn0BgBlMDjn2dt6x6SyxliPzMAY/+izWdT47HaN
	OqribsaG1caZYaznIz/qUPiUf+cU6cuhm6rnshRc=
X-Gm-Gg: AY/fxX7Kt2VRQnMH4vM1W7Zm44wXtP8QmSYkveLItlBEblh3YBlJMXP0E2ajVIWgaVm
	/+Xpaurut3f/TMlLrxj1DWk7Sst/KWTRdBVauG7K14VrnYYysJc8gJ1kBdxQnnv6o0sL0+udmX5
	mYdadSyIkQ+GSUSn3PZViIOL5EGjxtPtLll7f9hGQvfFboepR5WciC6ywFxR1m4/8TOyRxfqjIS
	049Z6+J3j8wl+xucyIQZPIm361fzJreqwHfDltplicxSC5cZMe3pjSWgUcUQ/zdORZFjVD4w2PT
	mWl9CHqH1I5AWZ41NVIc7TAPwSS2J7eqSpuT5Q==
X-Google-Smtp-Source: AGHT+IEj10dSESv4tqdD92uZgst/HdgduZtFST/NwUvAzU4bgg9CM9GXNKBGTyQEbISBDFfwIgz40BfqPb/BI7eLkUw=
X-Received: by 2002:a05:651c:2222:b0:37b:9dd9:d203 with SMTP id
 38308e7fff4ca-37fd074cb0fmr9631101fa.11.1765566728739; Fri, 12 Dec 2025
 11:12:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Dec 2025 16:11:57 -0300
X-Gm-Features: AQt7F2rggIkxVWeg4u46uD2Cc-AiiURCFH_xEAAKKwLi1TDPjFTpo4ieh6EQ3lw
Message-ID: <CAOMZO5BuMLhMyMkfE1xhOwEs2U=+pZnVq+FP+_bp5W_Qg6oMxQ@mail.gmail.com>
Subject: imx8mp SPDIF TX does not produce a lockable signal
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99m working on a custom i.MX8MP-based board, and I am trying to get
SPDIF output working on kernel 6.12.60.

The XCVR node in the device tree is essentially identical to the one
in imx8mp-evk.dts, with the only differences being the SPDIF TX/RX pin
definitions.

The audio card is registered correctly:

# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: imxaudioxcvr [imx-audio-xcvr], device 0: XCVR PCM snd-soc-dummy-dai=
-0
  Subdevices: 1/1
  Subdevice #0: subdevice #0

When I play audio:

aplay -D hw:0,0 -t raw -f IEC958_SUBFRAME_LE -c 2 -r 96000 96-24.wav

I do see activity on the SPDIF TX pin on a scope.

However, no SPDIF receiver (a DSP and a standalone consumer receiver)
is able to detect or lock onto the stream. Both devices report =E2=80=9Cno
lock=E2=80=9D even though there is signal activity. The waveform does not
appear to be interpreted as valid SPDIF.

I also tested by taking the XCVR driver from NXP=E2=80=99s downstream tree
(lf-6.12.y) and applying it to mainline, but the behavior is
unchanged.

Has anyone seen similar issues with the i.MX8MP SPDIF TX path, or is
there anything known to be missing from the mainline XCVR
implementation (clock configuration, channel status bits, preamble
handling, etc.) that might result in a non-lockable SPDIF output?

Any suggestions for debugging or fixing this would be appreciated.

Thanks,

Fabio Estevam
