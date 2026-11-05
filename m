Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875387;
	b=4QbeMQs5xOpshYUjw7qlVor/zl1T9dOurtFOjrODP0/T/hGPqKFh9Pp8M39CJNSy6VIP
	 eo5xsE+3TMr7kCvBshV8dYfwhF4E36THfAnCx+8AtB9x7VFKloLiEoRU7jBRy7h2vzx9x
	 nhQMsJL7RHy4At7oR9EB6yk/WghiIHX6qlrqAx4KvPXtIIeOXeuWKw1QwCrsENFZdTjIm
	 y0dFBO+1bocPGRnwQcFll8uBfAHwkG3N0dHxIJgRFSgczG1I0WmSWctHOp6t+A04oUjfV
	 9zwX5eNbK/FJBkauMLMpo8WZuqpuSHTptW3m8Z15mYlmXogea6SuEQX2v6B8MIesCEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WU0mTIuYpv0rehcbLRaasNOk5Yx7WkJzHYLOVNfF1wY=;
	b=OQNIRyya8te/hEbc2/W06Enk6J2ZkfkQybBXbJHgL5J3M0vPqnZpY1Rw1LNykDPWseUc
	 8CnYNEXkz2XbALjSPluKvRfrFd65Mk8t+TUkArdtzv+kw9ofqUVOLkUpOwLSwf0XB7zAn
	 HSCva1lb6ytlgfRMbQI4YfI5+gmxM813EpH8X2oVE+aAFlTjumPt++gAXsvnaAYOw28hr
	 dHppWzNPi8pBcC/4uLpUczFhHn9U9xelYswCIJkD6ygHlGXqMFJN7H2LbQfmreYIFixM7
	 AzRskLbwStEof1OSOukXjH3NBqQdvi9z8EFMVDB5507uSnoWU/PqI+2DZ2YZIqXNVUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsPaJdrf;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CAC606D81A
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CAC606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsPaJdrf
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so2909942c88.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875386; x=1794480186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WU0mTIuYpv0rehcbLRaasNOk5Yx7WkJzHYLOVNfF1wY=;
        b=TsPaJdrfPMNSicoio0TvfmbAOmwFm+KsdgoBDi6nJGpBVwhhBbxcGnOIAvtheSdFFK
         R6hVLA094QGG/Qc4t7zW4+xsMUQ2jpeKVCadXZ0rt1dty24liR5QDwTrI32ynBQZhYzZ
         /HaBXtJLkeLI9QA92GbM742hUAQk0rshzUxN1oQCWxDXi4VgdeEAsGEFZe38yABq0mlR
         D8TgJVcGj4GlOQtSeW4DLx3TRgkMYQnqHNXl+xdp41B3BEhsfdD+iiN9d2490tB/U677
         ZOBgEdqRlJTAz+PEGiizuSNw208ie6mX5HjaJWcZn6MLhJuJ+yEq36DIr0gfDUz7YWIv
         fEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875386; x=1794480186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WU0mTIuYpv0rehcbLRaasNOk5Yx7WkJzHYLOVNfF1wY=;
        b=pA5yi3zNqL3WARrbLKn/KFxMB59bjuroKQt2OqKpvd4a/ttU1CSu+BV4w5UtZTZxS1
         9vRtwg0QbMj+GCbqyfsMnNUXW3QL/9uSUtF+KCKKMFqkFgwcfl4FBsAW/3xAaZPucC8B
         R73+Llex8PDXQHZVe0RKpsPuLyCtn6Utymk90j9rcyU6ufCXKA12U2KWT0u3DzrXYvj5
         Hf67d2RcsohOLrpl/X122NCIppG3VRwQdo7vsyooEKuAvob5WFin+ydFc5Uh0GhAvqut
         vOijMGkKiDQ4RpvcJLrvULHHbi4fyeGVfp89brJBfNPYP1mR5rmTBU4hWbWBvm+lZWZZ
         W4TA==
X-Forwarded-Encrypted: i=1; AKwUvByyZ9eypvsht4ZKnrdbwsjWNpxb7ZIWO1x6JvRDIegqyGrmKDmnlOoNzUineOhzb702iKkKlam8uWouww==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SXU/7srjFoO7VQpoGVq3OBUXh8NiO5vhbeWLIB3v/bV6BV0zC
	RIfZYJigxB9lVA/m6NZJnAAOEscz7BtqOpwkF4GtFmf2KYjGtLFfHsgI
X-Gm-Gg: AYBFou0xm27EhM7lOFaSHgNSJdyIYZzCmak8FUja4xQfGJ0k9minPa1TELvsm422SFL
	HuWdqBaRIm4Qts7YZdpFB+56+PKWC/4/c6r5LEoWCEsNa8Y/IHYUi7H6XN76zwVRXkvXOJEthJy
	hyNJh1/39NKr6pu87BIFkX8VFhXIX8PcI0TA4aFx7z68hOCducB6p92Eb7ZOabaqRh62k4fAeYK
	p8kNyMTZj4BBgyP/Z05njfTBV6mlVd3+fRZD36DVnNcEoe5SUQS6NxvFRVheIb08VZhgG5T3hne
	LVn+oQ/bhzDr45YgQkuwQJwI484R8JLv+I6yqOM/DX4qjEw94HksvNmxlZP2snqPMv27iFOD3+5
	CjJ7dRWT/AkQxQNy19mUy37jRaMBlE8CfE5mNZI0VPPt8TQBD2lrAtuVNcW9qhXIyzq3dwYpPbv
	w/Jjq/U2NoJfSvMHHj9AOfBWE72WTQyvjdKojkf8Ls39NJecD8fqCnELWprTS8Xga7vOst9sprK
	63f77pTgF6wXxkDXS8FJaoP01CaqLQjLhjq3rki6RLUH7uO2yXcCd3zi+1/xTEaq0iTt3/ZWvGD
	zm4q6yPp5vOaCt4PLUeNnGHCjujR3r0ES/mxEoOr1Zl5x7XUkaLtMcbw1WTyREa+GoSoe1z/Jqp
	EbzdKgbDmifoYrJSY0HNhHEqnlnUqIlrHLvwegyAwk6kl
X-Received: by 2002:a05:7022:7f0b:b0:1a7:2ce7:ad10 with SMTP id a92af1059eb24-1ac5d69f67emr26766196c88.44.1793875385784;
        Thu, 05 Nov 2026 02:43:05 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:05 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/10] ASoC: fsl_sai: Address several issues in the driver
Date: Thu,  5 Nov 2026 17:42:27 +0700
Message-ID: <20261105104237.38542-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

I've continued reviewing the FSL SAI driver and referred to the
i.MX RT1180 Reference Manual when looking into its register
configurations and behavior:

https://www.nxp.com/docs/en/reference-manual/IMXRT1180RM.pdf

Link v1: 
https://lore.kernel.org/all/20261030091404.18757-1-phucduc.bui@gmail.com/
Change in v2:
 - Add five patches covering disable handling, documentation, 
   ISR error handling, BCLK ratio validation, 
   and preventing incorrect CHMOD writes to the other direction's xCR4.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
  ASoC: fsl_sai: Use optional clock getter for MCLKs
  ASoC: fsl_sai: Remove redundant error messages
  ASoC: fsl_sai: Propagate device tree property read errors
  ASoC: fsl_sai: Drop redundant dataline mask AND
  ASoC: fsl_sai: Warn if TE/RE does not clear on disable
  ASoC: fsl_sai: Clarify fsl_sai_dir_is_synced() documentation
  ASoC: fsl_sai: Check regmap_read() return value in ISR
  ASoC: fsl_sai: Reject bclk ratio smaller than slot width
  ASoC: fsl_sai: Don't write CHMOD to the other direction's xCR4

 sound/soc/fsl/fsl_sai.c | 89 +++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 40 deletions(-)

-- 
2.43.0

