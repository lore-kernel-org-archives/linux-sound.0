Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2F21C32
	for <linux-sound@vger.kernel.org>; Sun, 26 Jan 2025 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737895325; cv=none; b=lP6BnulkGitlWc3+NivXQO02nn536X0U4+XeTi8LNDGjeXjyHZoGKQoh2b1cmJqCSw/LULMzOcDZgRQ3wSzTLhaN0lCO/jzCAYFJ8+U2LJiwyevfAneO8wCxMRjlWHjo8Dx9EcxowuxlcyB6+9TUcam7mJtH8J/0xp2z8eqVpGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737895325; c=relaxed/simple;
	bh=VnX++PvhX9fSaLYQQSUs23OMy/0jRgInUxmZ3imlF9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVWwB8+//ODYLkYCdzso+//GKskmpBwcxDqEKVgb3blE/6x9JoQmz461/uYM2QTPdmgSeC+FSFkynzv8ifoWnm3KIp6dBQR9NaDlRcjeAItLZigjSDcz+XfNp+kaibx+XxEqSWctUvVu/mpKT/jTBLZYzY0o75XQiMoIXnFJtsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GKy/pnge; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GKy/pnge"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a227b82so3312399e87.0
        for <linux-sound@vger.kernel.org>; Sun, 26 Jan 2025 04:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737895321; x=1738500121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHJPjFgtb1YF6qa5Lt4KBVMfhDJmFqKHqxkQawLDy0M=;
        b=GKy/pngeglniAFFxGH1S5tNeIOIFiQlaZ2vwgKYVpLl//rErIYIGn5h+1lIuma/EnV
         dOFg97Y5MgIQw/TpUAo+0QBqMRCLvKr/G0yC1hxNB4jNRTx8c9H27x07mC6Xpf0mdvgJ
         0eEYan5ZPxtyuS22aRn/SigJqO4qkdYjUODfWgJwAYXZc6pDzIGmHE9pTkpUED1AzegL
         XL4Xzv1ZBAtUEqPYSUmfPMn5w4z3E0/8o7oeltl/PcEmtFspa+uPMnXYx432PR6nNNHK
         zo6pKSbX/DiogT0Bt/SlA0KaJQ0BBvxFVaS80RamQKDHaOHynKzF7cq4cSkwu1+OrP99
         2Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737895321; x=1738500121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHJPjFgtb1YF6qa5Lt4KBVMfhDJmFqKHqxkQawLDy0M=;
        b=vUq7WX8VkMnHrsMBr5qHOxmUxQyi0SHe1cvIfq63JnA90kraj1CL9sm9gochJHmMJj
         mQD/vaQKaUnYIWK3KmIa8dqHlKkwa8ZkbEj7vB/Llkj6k97+OXOx0bY2cqly/Ou6oC59
         kGPpdhCXbGVVhCNOWjkDaIQw7JwM038+szCzkAsYCSHXv+LUcTrE+sZXIRwqghw/Ar8j
         2KLUjs4T4N+hJmRrmeVY1U0/p3MIXvwgutLts0OO6EAKryfyJp5k54xSbsydpe5aJnUe
         mcJHh1Kz7BocuQLWCARhx7cqGn5DdQFa3165lpUY75JGdoLxCPRt1ooIvnXuMM7iz7tv
         KqAg==
X-Forwarded-Encrypted: i=1; AJvYcCWyfEd25TNqcAo6eeI62AotNVsePp+3+AUA1TBit9bvhU+EEoa0rU07Az9sAOuAu9xMoo4Kgkv9p0I1yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zsgwkPAu888OMOwyRemeTD69FS+JwNS7nLxhE0udd6lEZ65X
	yAyZEwm93mSQbWuzSYd+rvqMGXjpSVchlE642BeSB2XOFmkiY9+msAPrT6aJPWc=
X-Gm-Gg: ASbGncvaLT1Ci+kiPkT2JXW49K3fVKfqcCLI8vijNM1nU1MbrcsrHjyLF/oXh4eJFEL
	21P1aITaRf6K3/AknPztZNRTojH6Vqc614n28dRnGFi4IhNG1koEqr8A9OWPXmKvQ4yfdYkTNNx
	2ke+FpCE06qivUfLh2YKtdP2CnTC0y6bi96IYIF2vDxySZzHY/g3LT4lN/PwmXLX6SEAys5QZN0
	Eg/3dNJhzinwplAh5fWxuefTCLFMGOhxCsZypv6C+NsK2YpkUpSdkX9Kc8jUuNdAgAndlkmimJR
	zet/UCMnhcA/O244BpHtwh0HugykUColEMqJPEd41PEvYhsb
X-Google-Smtp-Source: AGHT+IFXyklMCwy8gV5KcJAacumwDn3d94qptV4fqtOKVqO9v/8V2Dx639YgDjIcQcsQYse2Y9lyog==
X-Received: by 2002:ac2:4e12:0:b0:542:9987:6ea1 with SMTP id 2adb3069b0e04-5439c268010mr15675317e87.34.1737895321385;
        Sun, 26 Jan 2025 04:42:01 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822924asm903127e87.49.2025.01.26.04.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:42:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm: bridge: adv7511: refine actual capabilities
Date: Sun, 26 Jan 2025 14:41:57 +0200
Message-ID: <173789531323.2915366.4617860271687582791.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108170356.413063-1-olivier.moysan@foss.st.com>
References: <20250108170356.413063-1-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 08 Jan 2025 18:03:53 +0100, Olivier Moysan wrote:
> The STM32MP257F DK board features an ADV7535 HDMI bridge,
> which belongs to the ADV7511 bridges family.
> At startup the Pipewire audio framework parses the audio devices to
> discover their capabilities. The capabilities reported by the ADV7511
> driver are not accurate enough, which results in warning messages from
> Pipewire.
> Adjust the capabilities reported by the ADV7511 driver, to more
> accurately reflect its actual capabilities.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm: bridge: adv7511: fill stream capabilities
      commit: c852646f12d4cd5b4f19eeec2976c5d98c0382f8
[2/3] ASoC: hdmi-codec: allow to refine formats actually supported
      commit: 038f79638e0676359e44c5db458d52994f9b5ac1
[3/3] drm: bridge: adv7511: remove s32 format from i2s capabilities
      commit: 7c3127e4814c304c7d5a2fa796a42e75a9b8606f

Best regards,
-- 
With best wishes
Dmitry

