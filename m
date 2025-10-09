Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B062E11AB
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014278; cv=none; b=gf/0QgVJNs+8IdIcj39IrymRI+S3AlWslIiyDnmKBJXJ/4ykO2JoO1zirRwHNYYDhnuTWmENxLSVn7IQI/79PH3/MVaE2yC3HPmZLCqiuUsk9AjfGL9DOdNm1sZj/43Fo+F8u5J3Z4+nr/qKPvG5W799EIvfeM0x0LEe6jFjFr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014278; c=relaxed/simple;
	bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvUZudF2TLnOJ4Vy0zjVX/5lkqBlMuinKmde9S/g0393MRe3kc6xz7cuIZDK1k/3J5w4sk4TYuiIBLtlmvSHHCah1H7rtW73gA+963a+I4ffUpfIAYDn8VicdeBysYGnBBkG4keit1cOXHYKlp+MAOSFwInT3ns39mPJGq965io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wdc9hLUu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wdc9hLUu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-271d1305ad7so14928495ad.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760014277; x=1760619077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
        b=Wdc9hLUuJucwAMpLB2DINPGvByOuHXuXrfmBzAtrLNoR+o3hAxW+HL/WrrOQsQB+2t
         PObv5vNwkaEdjOhHTLFk4R0xJnX3Oj4HSGl4+KIx935kx2ihxNgFlJpqcrCOAPFKkoCL
         JXGyAvIUAmCPtoNRWI+XZm4MX1bfYSyf+cM3Uh1/znpWiPJo14gfwggNT/hSXBsxgB/Z
         x7W2+O2zBs66+YBefmdZxe9ZlB+Xypjv0sui4gyQyQ0gfbWjtQcPYX4PjxoTqUsU0vJx
         ODZXqh/NKl1nXaIq2mtm6DAORXAVZcZszCl6SsvcDe8+L74J8NZVvTaC2G44U415fzG8
         k/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014277; x=1760619077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
        b=NUiUbRDGmNDY5CwKL7npBr5M+tPjo2S4CTySdn4HXuvZaE73PVWwBkQxY6wLOQnBrW
         4pB+D0VOYnxhh3xvflWkN4Ugug+GAQVbD+n89cjlSlevxvZmB2J3Umg5y5S4McGtEV/B
         MvHk7j9JqeSCQ/SYLdr8aQePMYZioJh4C6fBhDnwO+K2AEPGZTr460jI1f8t4bjFlotA
         gm8umtfb+rtOVQmRhZ9WOrJMlNuLHsj9NCqBVZJaMgJcJ9gJ9y5y7+j6/V8Y5H/ghugP
         NGA1/4/2q4sd9PxHHvCgjCa6mmE5OhoySmfn+jwNlFtv4Lt+2mmMN12gttxlCEV8J1b8
         yFpw==
X-Forwarded-Encrypted: i=1; AJvYcCUA3bhhZ1RqKv/Gh9YHlkUhXv1y5ycVGA4FAbs9Q59xpZeaYDf0g57Q4MnKtpJ1xtYhSP8gw7uA8OE4AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7tpIw5QRw1ZJQh+n9OwNbfBXMbEth0272YXLzwh5x+Z2S8A4Z
	zJTw4ChO2V88uIwJfzOO9rsU4oDberZ+47Y8fipl/ZVtU3OGJG8sL0hMnVlZOuB9WXiJM7R+6BW
	l4xzytBFIc3NAmmqIVv3rQ2QtiPm2kLk=
X-Gm-Gg: ASbGncugOsSQSZKLhomEbuXHt3Y6miT0V0GMWDPSFCygEaaMSMsSRmlUEJSl8DejOZ3
	LGfHNyNT6qVBm4ClW6LXIaZXEwEcgUMFLt7KiL1nnS0x4Zvr1JdLtegDsVtHoBKnEo2HWMn7JZM
	A9wLW02xlxssqZAfFtcsGBKiTKJ2K2cjJIbA96G5TwsxFT/TOPAA+YR9CGX44PsGxPMlzC5mHv1
	g3OZVVNFEkeEz6AgknrnpaI33TLQexC+uRt2NA9gfiyXEuGIkru1QqSpfUP
X-Google-Smtp-Source: AGHT+IEhAV1wqwmuEfqj9eDPRuTr5xhy6QzH+Fe4j6lHSFhQoyHt9bJp9C/EYN1+uc18PLR1t+1Bf7rHPlE1k2VNj6E=
X-Received: by 2002:a17:902:f608:b0:263:b8f:77dd with SMTP id
 d9443c01a7336-2902741d0a7mr98644915ad.57.1760014276668; Thu, 09 Oct 2025
 05:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 9 Oct 2025 15:53:34 +0300
X-Gm-Features: AS18NWAD-sPW--RGZUkk020BQr_wBUAqvEISI-DaoXi4Qt_J4rUCZMsA_rvkqkw
Message-ID: <CAEnQRZCFk=07=tDgEPJeXx_xDp_6LGXi+2o9GAADoP86mWYZ2A@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 8:30=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.

Tested-by: Daniel Baluta <daniel.baluta@nxp.com>
