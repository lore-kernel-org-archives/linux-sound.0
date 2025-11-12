Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56972433A6
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 02:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762914034; cv=none; b=ObfZIqonyq7iDG/+IX3ZkCB7nmM/DbIbNRBfp9wWqbIrc6r1tIsCl33FEgfEFFNRvOdhBw6l+OKSvtINHIvvqeJoV+D4mujwrgq6bMS+of+MWv2c7Esm+HdWnYH50f5T8h6q3g/32IWFCIAJLdBoOeKiRfcq3UIHWMp9NfjUdkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762914034; c=relaxed/simple;
	bh=vgXKVXLg5ka/gs4146ICOeO84aHJl7Kla8+sb4iHUbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHek1lk1Qbf1NAne+rP7XR4YJdFuMXnuBFLpUGZGQKmjI3N9JD09Qq+w30h3+d3JiNfMvRaCH/KaEtcpKQh49y6mD/Mm4+QQ2T6tkm3fGcyRz53E08a0Yz3BZvn1UftcpGN6sTHrHcvwiWrv4qlUGJtLjujXM+kNZwf40DinKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d70eHzPX; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d70eHzPX"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so328451a91.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 18:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762914032; x=1763518832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=;
        b=d70eHzPXyCN8qyAfCjGLQ+WwqXGswhEERM7yfeyWfPz/j/3UexR2fKVTmLaJRZpeGk
         pSgzY2A9H2tAHjizQqv2atpT8TMLu60BQO0wXlolEPsMUsycHXvYNIPDUFVmq327HuWD
         xhFQ9pvQrOecJXeeKrQYBkv0VvTAOHqlOGtogLobztqqpTPS9UCVQA7Auycv+B/FBxgJ
         k8bu+pXak9gzPW1Hr08aWus8WnNcLQilb50Ikgm2Nn7izeQDEYY8r6wFGW+OgFrZXWdf
         BcK8A10fk2LMB6I80RaZYurMms0I2ZcJNTyonNbLmUuaN5c6uAZAv87YUjrVHTHe8sHz
         CnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762914032; x=1763518832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=;
        b=klN9bX2MsCgYhF8YMtzfgOMDYh5IiqsvCAXuvn2Gy8bwydQ4QvO1HTdgLR7MX0DQXy
         3EhdZRW0IujwQHWsB7xhr/H+weXtjH4dRAO7b/ZetLy37nlBMVHybsGNu5kpctVtnVMq
         eunlpCFlGaTJfzUB1b/N2qESh9qzQfgKpTg3zqq0KskN8xTvgmko9Y7kQZ/DIiRZN3aK
         WTpSwcZa99UDxaAMvReuOjtni8bISdx40kzbqQn/7ZTyOCrSDHOqnnX7yD1qcfkrxxD+
         9LyN6dGZ4DVqoN/AD2qn03ijTdt8d8iEQvgKWVhyQAeuU7p+QeAtRWCNAKFmqdRlBEwt
         FQJA==
X-Forwarded-Encrypted: i=1; AJvYcCXZczf2gSEoN659xePtC4VVjIgqoec4mNEKYWaUaELyAzjYpw9Hp7vjUGOtfXPSFETbQloHBiNaBMkMzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4oZ1Ft2S8TsoKKkv5wwvtCHZbZ45t3bIm5wFWtDOo0gwqkoSz
	9NfmK1NsXWG9/rVO2GerZ1yDcP6mj4myEO3Yo82odSCxClKxP3WpsjgVHO8auXlPcnyWxgZY+wt
	2lWn2uFmN14ZPLDXn3LlAPNdtOryB1Xs=
X-Gm-Gg: ASbGncsnSVwjClTAtiYDrQ9ZtoPbg7j2PZrnGdipSdPgPrrbasX0wTQU6ir/rgFMTfv
	ohozvoTDVfUS+qDGOmIXzuXNbrO1U9e0jKJRHoRCPybpqH0l2GmbAp9WszUE5jInLKRNBClRJ2R
	nySF6mccvq3SuSdRf0z2uVeMzPuUp519T+ueM/7yMVbKis0HhmeY7ZIO3y7y066EjDnTRUHl+7t
	QDj57MuKKwZYtLMq2oozciDgOyxYBamZRjPlwO1bopKsqOnAsWg+18nzeRd
X-Google-Smtp-Source: AGHT+IFtc6HQrz/xKZ9emyb5FEGlT0SRf+ATUq6DWBXr3zYhujoZ6/yNyjXJ5nXZWWbTjr5BzqbESW0tw1NXrAGBcT8=
X-Received: by 2002:a17:90a:d88b:b0:340:be4d:8980 with SMTP id
 98e67ed59e1d1-343dde27552mr1630702a91.14.1762914032513; Tue, 11 Nov 2025
 18:20:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Nov 2025 10:20:20 +0800
X-Gm-Features: AWmQ_bk8d1h8tBpBrZUtGjow-hV3gnwT5P-EgH-CH9iaE3RQY3pwj7BwDScJKrc
Message-ID: <CAA+D8APHUZmP8qfta4=YL200hJkiikru8yQPddvBZyx-+-1ZtQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn

On Tue, Sep 23, 2025 at 1:30=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.
>
> changes in v7:
> - add back the mutex which removed in v6
> - add Tested-by tag from Alexander.
>
> changes in v6:
> - remove mutex in dw_hdmi_set_sample_iec958()
>
> changes in v5:
> - add empty line commit message for patch 7
> - remove blank line in dts node
> - add component_unbind_all when dw_hdmi_probe return error
>
> changes in v4:
> - separate dts for soc and board
> - bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
> - add "select DRM_DW_HDMI" to fix build error reported by test robot
> - remove unnecessary code/definition in pai driver
>
> changes in v3:
> - add space and 'U' in asoundef.h
> - add more commit message for binding doc commit
> - add bitfield.h header for fixing build error
>
> changes in v2:
> - address some comments on commit messages
> - add two more commits:
>   add definitions for the bits in IEC958 subframe
>   add API dw_hdmi_set_sample_iec958() for iec958 format
> - use component helper in hdmi_pai and hdmi_tx driver
> - use regmap in hdmi_pai driver.
> - add clocks in binding doc
>
> Shengjiu Wang (7):
>   dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>   ALSA: Add definitions for the bits in IEC958 subframe
>   drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>   drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
>     format
>   drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
>   arm64: dts: imx8mp: Add hdmi parallel audio interface node
>   arm64: dts: imx8mp-evk: enable hdmi_pai device

Could you please review the above two dts patches?
Thanks.

Best regards
Shengjiu wang

>
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
>  drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
>  .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
>  include/drm/bridge/dw_hdmi.h                  |  11 +-
>  include/sound/asoundef.h                      |   9 +
>  12 files changed, 382 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
8mp-hdmi-pai.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>
> --
> 2.34.1
>
