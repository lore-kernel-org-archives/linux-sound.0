Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044510;
	b=PvgGtYb909o+dJS7t0jGMW0UzPUnuWBvxpALw1BZxI0FErxBuyT9ThOjaIjkEJjX2vYA
	 +0uEP3YSnGoOY20PS6wZNs8B8s4Fp3fASQ42p362gPhzoWr5Wk7Oel8t9mBkaN/i3d5a4
	 Ar332ZJmJSMbDEqyV4q7Ij/o9I0mXy5FB8thqnYs/1p88ZDTKoNelRmdjD+pU9BZrmYCH
	 Qtnh9aeBk9Q4cKgrMIHx6REAkttkIengS1dptDfRVSYODJCWVvqNYLJSQXfy5gmv4SGPP
	 j0AihQQLe6uEPD/yXaRiBiraB235ezV4TksruvYM+zx7I1ZbjP0GkNEPDrC/wThAwyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
	b=SuKsUkfnrSxHGVWerj71no/Si3aCMCQjtLyaGkJTY9YsgtpE8qHd3bwkd5FycCX/q7Lj
	 0pGYQ51lVIZ/OJdBe1JfvedshzrW3YCH/61vk4JRbDsq15aVeVdcafoMb9NNiACK8AhuL
	 E+dSKsi+IHlzR+01FCgDH1z14aENlMwsSoFI8bXnBpkMSRasq0hEpWfKM1Ppw4Hdx5W5B
	 rVkSoM4FcoSeAngG2rCApSPwV98vEDstSOc0ktPpBFGPgiyVVIEI/y5tuwdO+9kqcLP60
	 IDchaqfRIRABxD45zIYmZUz27M4HIX3SXGF+k4YrWWUWT5qZCbDMMTgRDzcTgpLvExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTHFVLQ7;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1347606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 09:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1347606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTHFVLQ7
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2330934eec.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044509; x=1794649309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
        b=wTHFVLQ7lIK8cCXieQb/LiXf/TGXT18n+melB6SbVAQtrewoWsMtNSpaRRmmiyMWeK
         J3e1fUnsbEP8O9GbYUo/qnOn+pBmltZ7VSr9piae9TDTbJrU0jQtR+beThqNBizI/sA6
         GrGAgLSo7K14uD7iFbhCW7sLyanqbul+D2aVIhub9Dlv4Gw0XlaeZpopOALiqhKx9cnl
         7DUFH2VjVXCWm4pRAyltmscVNmpz7xeYGdQK85CU8Wjjb+9KqXahF7I3lWNkBWZ0ec7r
         Pmbmb8PjauMHCuqDUm/s/EmQu0qje812wBNU/IdF3mizlDBgEvAWH308u0N/VyaWT37k
         fvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044509; x=1794649309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNDsPiw4j0+WNidf/YoMdMZHFxZqM2vx1Wj8dYRujeE=;
        b=cw5LjeBzap+Ee+779XqIEm/uY8PAOjUqwltumuQkUTYJpLClGToiSH3Ze3louMqaRa
         TWKrRGqXkCBnJGc35E+z4OX3sfwIi6SHSxTYidumIoWp/weVP1faCWyNKCq3LmLYkWaM
         5/7MLa9TbcpW53qJA1lWGatVAt2qd8HR4aW6+KT18liWs13fQq5/jqMEw6HMqZrKx7AU
         wziTGA0KDygni8kbElqwxojv0B2UFXXvYYZKgQdmil7QMfwxF6jz+ktTEFfauvCRzxoD
         f0Sj6+a3ILiJFXjV3taeJLgKTr5rOg086vwnluIgu1v3c0+Qiifew1KvIA1DMS9CMkMD
         TbKw==
X-Forwarded-Encrypted: i=1; AKwUvBxeWUQq4etudf8xCxdUXxG3dFaQRVDqvCtzkSPQ0stA9wP5OWMZ2oCmfHCGfE+5S5NUyjieatnxzo7ygw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ly3kYdPprcY10DAUWf+6ApAkJ+uz/dgoy3clPCpoVI20jON7f
	73G+MJ+bG4FoXloO1GCOyMT8GfQhFByUSBTNqsVJp4JiaxAZ6gHHmQKT
X-Gm-Gg: AYBFou0gcetg6z5I5xZFMNFJXt1o6yrcHUBJZoVii8ZW+IBZ3fVzypF9kMRRestAKbT
	wPQZdlVII14b6MCgRVswvBGb/8+3ykcxqNb1RfaUZ2Z8OFjYVjx4UwNAgIhmDnrLjiJh0Czhfgc
	eBoPWqxoRFEvbK/FJUHXc6Z+PDqfJwV54BHr29IMIA+fBIEc170mxc3n74HlOeLjG6X6nX2cVB1
	e0TXcFQ49X1Su3E4y8+NAgQKYpNXC3zr45Pay8QXDRuqUWjTqWe6ifVGQVhU6Yt0R7QfSgW8zxV
	A6Fh0mw5IKB0uga6IvIsIFd8U1L72J9RgGt6Tk7K2mEQB1kuUmxQgOlcL2bBRw1qP2G/MJ1XF1L
	ufTaCfK/js9Lk+bI5T6o/LAV7ULKdHVIkFb1kvZPORuGDC3jYB2C/l85BiTpobZdepY3Y6iUSlZ
	TUOsoHlNNQx3tLMBJeKXzu5BXmedSvfa/tG24hV2i3wPew43EKFLqt/QXuu1oe8cO+uZoKyHKYv
	9Qams0jBD/2UKixAFAMQd3pHsRwI9rucXZ7ua4eikyUZirniOmhfnDKDeJad85xh3NlsKxYd89N
	CtGYBS2bliAr9327vu7fZfgLcmmQUqiSOilp60Nn/RM+YwyXFNSMSdFshOQWk2r3pA1fnxQKZzN
	EVOtME316tr01JmvS+hZoOtkFveS5+uSlVf92UV5v
X-Received: by 2002:a05:7301:b0c:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36f76023a2cmr6744419eec.18.1794044508755;
        Sat, 07 Nov 2026 01:41:48 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fd0000sm12554457eec.21.2026.11.07.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:41:48 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] soundwire: Fix Critical and High issues reported by Sashiko
Date: Sat,  7 Nov 2026 18:41:40 +0900
Message-ID: <20261107094140.3951536-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
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

On a Dell Latitude 9420 (Tiger Lake, SOF IPC3, sof_sdw with rt711-sdca
on link 0, two rt1316 on links 1 and 2 that are aggregated into one
Speaker stream, and rt714 on link 3), I tested this series on top of
soundwire next at commit afd88e7ad781. Only patches 1-4 run on this
machine. The intel_ace2x and qcom patches are not exercised here.

With and without the series:
- all four peripherals attach at boot
- playback and capture work on every endpoint
- 40 start/stop cycles of the multi-link Speaker stream (10 of them
  after the links had runtime suspended), all links streaming at the
  same time, and Jack Out start/stop while Speaker was playing all
  passed
- ALSA pcm-test: 24 pass, 0 fail
- the dev-properties, dp0 and dpN sysfs attributes of all four
  peripherals read back identical (the words arrays are empty on these
  codecs, so only the trailing newline goes through the changed code)

With the series, s2idle with Speaker playback and Microphone capture
running: all four peripherals were attached again after resume, both
streams continued after aplay/arecord re-prepared them, and playback and
capture on every endpoint still worked. There were no SoundWire or SOF
kernel messages. I did not run the same s2idle test without the series.

These runs only take the normal paths, so the failure cases that
patches 3 and 4 guard against were not hit.

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

I am sending Tested-by on patches 1-4 only, in replies to those
patches.
