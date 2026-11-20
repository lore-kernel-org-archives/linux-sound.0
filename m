Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135502;
	b=zphmJyjcss0AFnndqk73pLVA3Q1T23X1MpnzJWeoleMP+2DMsnr4X1Dvw6UGmZWv9Zqt
	 t0PSqZ89VpFEnvScJtxHKb5nG8POnb+pzY1u0p1ykPqErrCwbzhThhVCG9FhWV9/AQZ1q
	 ckG7dnXU8gN1zdDrPGkb16cSw0lYZF6Y8s4WshV0dIQUt5Eif0nwTz/DDuSoPYYk81OUy
	 wwkyzERv/R0wFdoav/q2kTSmip+GehLecv2fkfNEM4MLnQdGE0gt7ZffI/3bB1Q2yM15F
	 Shz+9EsbF8eRjaHx7w45xL/AicwX2X4g1ZElxqkSG3ZM/bTkhHLrY6YSDtg1W7bTX8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JRTBHIpTWIqBv7r65/gBAKVj+F4qPH6q/QJn+QQC8WA=;
	b=wbvh9dKUsNeE4U79R94F9q0wI3OlTA2ZNkSOQgYdodpiutMSGZ3UUqy1qRBjC3V6rX1K
	 nh5diK3ufuvxTmPmapuw7CyaWoNAaJLC/J4k43wYcY6VHWXniDxJbM0PX/UgzSpkDZq8s
	 n3v50Ts8C8sXrm62U1LqdFPyEiS7jV1DTUEWerQLavPEeTwHnyNuZ5nx/5zul7WRoOMuT
	 /2MiNs7h3ZHP8vCr9x2MKYiKo5EMwoS+BHxzPG+sUeNvRyMWdc87bagaiFLqXjaoi0HPd
	 XPNtaatRHXbjIggnc/UToGKsO9FPKO3Z/usEIXr+YhRTN6sIvHdnW2Mw1fhOoVFx/Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k5jdjNR/";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61400606A32A
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 00:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61400606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5jdjNR/
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so265875f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135501; x=1795740301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRTBHIpTWIqBv7r65/gBAKVj+F4qPH6q/QJn+QQC8WA=;
        b=k5jdjNR/v147PjWndPSaowkaaYUjxKZbPyy+9vufOUYKCBt7oJTuUrrfV35VtLkiPG
         zzZq+aR7MerRh4gzoH257V0QyxeJEdsd2noayoFggVhF4H1eM1BNjee1Mf1lqSWnSUso
         pweYMgShg8RNhgOjaniDllXJnxqFyyok8g7QSHh4F+DEcXBYf9vFi7D2ymS27Cjv+lx2
         DA9cpUWnIyMslfbpb7cLqeudDUOEcR7A8gu6kEyfzOQ3e3cmanoGkkWcZodD1nvD2E7l
         FLUFV8Ht+js/oju2QPsb4quc0lPcLfSxhY+cyyAe8Hvp2ti0snRj5uEbT98nNJYsmf09
         iVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135501; x=1795740301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JRTBHIpTWIqBv7r65/gBAKVj+F4qPH6q/QJn+QQC8WA=;
        b=1xohqA/9oSgLF3kzGfX/UabtxVLsxdM/rDaeGZ+ANSzKbfMaXWZCiYvcAbH3Sh+5aK
         5KkH0JV3YaVByFMU2J7yp7pHrA/OFjXy7l2Ua3R6p8EiIbqzCZIEJyY+bPWDmbFN49Eq
         vhIz9qZfNnUw3hamPuUuTEvXneaKLDyat6u0av4sRuoZvfhTIt2eK/wq/FZQxtiBW4Jt
         gZ7AerNSjIuJfRVRBaDZo0QOwotNjMnWiyTF2YVmtY7RmG2whA9XzdnAgf5EpVYiny9n
         mNW8Jxfxv45Qmh5Xaxgc1ht3LxAj1foPeDcJLar00DETNbdA3vMzOjfMwQWWcywvM6aS
         L7aw==
X-Forwarded-Encrypted: i=1; AL+hErEbgHGtGjCj/jZs8orfUh2mVdLBxTQIE5PNN/Yp4aT4Yx6WFGHLu+jMpksbkZz6Zfc5PJXP0DdA9omNDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vzw+TpTDPCeeOwlN7nLAu/3l81n4myXHmdvRVZKaCWWWzwxIv
	UBIbO5FJRViMnp4FMHkti4a9lMNpate7zx55KN4MS1KpCtOH2zaKtS2l
X-Gm-Gg: AZFdTZfnsG2mjlWPOkw5IoLj+CM8ZwDxuOsPwYGGEA1T0zLJFN4Sc8zBvlMQS7YuWTL
	cReHk6lDpR4H6KfI8edA+/95mA6yEDe01qmJoFR9Shbq5FVPPn1Rkmek2/gtL+g0KPliyf0EIIk
	HRzs8f9L+8FpIIaGhqC/gabfV93hPpiOTQW6iAdXkc/b9+YL5sVsla+Rv1aO83qj+AwGlln/EB5
	C1Pnc7m6kugaccYDP1bkDF909O6a+eEH2PvWBmZHjtZDU8rvmhyB2I/xQHJYyia/v1MzA2TpA30
	h7bBSEKXUMuHOmCwKlKA7BYYKk76M46HX+ZVr0USFIel1O91mXUK6HBGNEFbXMGRtbEViBjusUz
	Fm/eku9Nsu9WJQ3w7aNbic+lMHBXS+I+lEMla7kGmCW79BCxeNLMht39LCFVpHTcK0PCJS+JQdU
	TNSeCrwV3wohIhhH0GUz9xI9Cbm09o6n5dOgBKyx+zlaQMoGthf4DDIFKJeT+ZzVtY7hJpjAmF5
	PVgTHpa7Qtz/152PPCgnH30x8padAnuD7Sp5vEN+wdDNXmDqGfI2pu1hf8dTws7KxwDtZQ+UBNX
	phzdqjAK0v6XozwnFX6WbV+cN+X0eJpXFx3olQ==
X-Received: by 2002:a5d:5888:0:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-4abb55183b4mr2133903f8f.56.1795135500681;
        Thu, 19 Nov 2026 16:45:00 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm2438480f8f.51.2026.11.19.16.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:45:00 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifier driver
Date: Fri, 20 Nov 2026 01:44:38 +0100
Message-ID: <20261120004442.1687225-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <de369f10-e7c6-4528-aa57-56241bf700b3@sirena.org.uk>
References: <de369f10-e7c6-4528-aa57-56241bf700b3@sirena.org.uk>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Jul 19, 2026 at 08:05:19PM +0100, Mark Brown wrote:
> This looks awfully board specific....

v4 adds ti,asi-port, and the driver programs only the selected ASI,
on the pins the datasheet marks as preferred for that port.

> I didn't check but is there room for sharing code with the other
> multi-book TI devices?

Yes. v4 uses tas2781-comlib-i2c for the paged regmap, book/page
switching and per-chip access, and drops the private copy.

> The tas2781 checks to see if there are one or two devices being
> controlled by the driver and rejects a mismatch.  Also, is there some
> overlap in firmware formats here?  Again I didn't actually check.

The header has the same layout as the one tas2781-fmwlib parses
(fixed header, description, device family, device), so v4 uses the
TASDEVICE_DSP_TAS_2557_*
values and rejects an image whose chip count does not match before
installing it. The body differs: TAS2557 images carry a PLL section
and each configuration references a PLL by index, which fmwlib does
not parse, so that part stays in the driver.

> Shouldn't an out of range value be an error?

Yes, the image is rejected in v4.

> Does sense_muted get handled properly for suspend?  The core mutes and
> unmutes playback streams over suspend but not capture.

sense_muted is gone. The I/V sense ADCs feed the DSP's speaker
protection, so v4 keeps them powered and unmuted while the amplifier
plays, as TI's driver does, and sets no_capture_mute.

> This won't actually take effect if the device doesn't power down - you
> should probably not set use_pmdown_time to force a power down/up, though
> that's annoying when the configuration is the same.

v4 applies the change from hw_params() when the group is already
powered and reloads the configuration only if the new rate needs a
different one. use_pmdown_time stays.

Gianluca
