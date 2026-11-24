Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486476;
	b=Jh4jag6etg/WUi5tGD6fi0Ug3yauqxzSMFnwfaDjYOwJ2GdMPKWGox50c59TvrNPGNkQ
	 ac/M4D69k16c3k2SkboSG4TJg1lE0fwe4a0CzMA81a2jkq6R0he/kPeXAV+ZEhHwwOo2x
	 f6/L8o7iKY2jxR+DXg9JM8wPLS3RWiGK46Ksb0i7KLqBbhtNYCqsv/WxKU12ThaLrAFj1
	 7Xq5G+Ho1LRCPaDY0bzky+JNdiGzFQCziHgMS+XuiXHZVLhFiV11PkFwtWdcoR+UGchaW
	 x19TzHcqk0d4AT2l9iTI9ey6eubs+BC+a2Q4u6ZxsDrxo3LmM8qZ9OodzeYogQtVMUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t7lyZV/WXo9tIwR+kw6JoK9M2RVjX/WsSh8N1G2nxmI=;
	b=Egl6F4ZMR1r25587wIQ/+T+9LRo8xbSEF+3GS9SasxGgyAyhE8OTNy2AewyIWBTP3uFm
	 5vgbkFz9RTyO7akCndfz4+0k5z0rZ8c/R+NXwwoRN/z4FGjKV8ajO6vjl4q7pk/pGdK/h
	 NOkv7KJf0gRjPqe7zq/d0VZu2T8G3/zcbW51Sly2YHyc+Jp9nJWpcwpi+DzEli3f7ZQf4
	 UC7amMJFHoKZECXrED9GWxGdVJ2gL6PnrT7SG9TxMS21kiRQWTJ71KnNNrvq8fcRp+NpT
	 7mlBS1OOq8a2hNmH8vixfMYnwvaS8YdXGu2P3nDBsquM3VFBzJ3+FC1z2XVbEOnomXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ot2wQrSG;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38F606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 02:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B38F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ot2wQrSG
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so588872c88.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 18:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486475; x=1796091275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7lyZV/WXo9tIwR+kw6JoK9M2RVjX/WsSh8N1G2nxmI=;
        b=ot2wQrSGFD8iogfnt/LhoxykZjMmduMu9KyaK1KctW8UKVQj20x7lGeqU8ktCEPsxo
         lItLIetEAnuQkcTX5N8IOzwLoyaIRXSWtcycb04MRpgYLqi7Zknza1dRrSjLZ2c/oBkd
         HTIJDaDpk5UO4wMCL/WpLKe5vwMooOeaIEXr5RUm6gVMGe9/DXWnvxCgOjcCbRqnxYLj
         CwOUnA9lDL/Ck8AOriHQe4YvcrqQp1ZiOg8beBR08hjNbjXAtNvvl7h0W6KG90ITd20H
         gsu7jCSKRAkgFL3CRmqPoGO8095u7fejklOtpNfivmEfKZL4Tr/XZCOAE3gBSegsPAAi
         8sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486475; x=1796091275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7lyZV/WXo9tIwR+kw6JoK9M2RVjX/WsSh8N1G2nxmI=;
        b=BJQ7QGwWoOVQbUs7aNwwKgEvUu7lrWQVR5x1OyuAtqgSX4Ic9xQfvrUGQq2R7N+zSK
         LmxDTsft8L1buLw5FjStOtUPK3Mm9zRpiPOAXRif2dJvIwtkevMlpuYbWc7/Oq0+IPpT
         DlOOjnyBhu5Bn5fGojadu9vwsw80uN38kINY9eMR3JWOZ5Zknonnbio1agc8LDHs/twb
         rXEiFjlbk0nkQPASXfGR2Ag1Q1TykzJp6VslTB9ucUV4hGGLcVvHRH+HTsBkfCXZzK+R
         rR8kMVa/952HinfUHt2HambgCAgm/25+hsiKQrQgo1T34H6s4RPZTH7QAQHEbdYc3xh4
         ByCw==
X-Forwarded-Encrypted: i=1; AL+hErG6RFxX6pQLQk09dIEQKc6LFyvn7gkIPBQjIIju2va2Zno2YhKLaQGSiOp5XLcGxsR1RqA7bMul0a/uGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ck6A3t2gopMJ4M6vdhRO84ZcXS0oDpTpXhtP7wsKUBExYvYLW
	VA2bOLSpBZjcJoHJqvhRJzdf3qR2PsNQhsHLMNGfm+xMFliuyrcT/t42
X-Gm-Gg: AZFdTZfYiZEnc3YmWeQLF3X5UlySfPkhC9G4XhdftaSRtRBh0lZ3FnODdeQhtze2+z5
	2hAFtS/mCovdC84Np9DZClOyjuoqw3qI2A5J3MQMuAc8qSY0/v+v/RVzsieoqUHnQpfzAWNSUfB
	rYxEU4ktgQiWrx+fBNTe/W/nQgfSWW1BUOrAugzJwk/oKrPgz4WkJs0QeinSLkaGTOBRz5qlzSe
	iX97EidMQEAm0YRWx866W1rk1nJteRRHtty9qy9CFbDfp10MukItBHege6wcJ+l4YJr2gdWDmI7
	AvZ8zWrtXOL1JfK3nPYwvV4mgFqR9cvHwrVa/ubbFHFNcRLLugR1KMmzabc/BfCerf0wgfNww7/
	nC7NLB4EjFWFxPC6khlVew+9RuWHRY6oJXrA7rSrt8YMMqWz3XnnAxQecWRDPQYdBYeV5T+CTtv
	ASWLrcqhjuDm62JgwjV2uz9ymgfrdhTYDqYmwPtW1yjYLjjFZJpkIwqg5IE9Le+F538YKtR/nMi
	grcKvC5BbmFEzc3WMs6jxjv9gP+39SJjFH1Yky9li7NuLuJCCma0+goDX9gqulbzSVrSXwYXZ0y
	wj9/x9a8WMTLNxmOQ0UdydT1fXVrfUj9FY4IDPMgepyvz2vgdr8Z3ug9eKKHsHnhDEGIShTu32B
	bptJCOmEKgXJyoUCGLUR0Qzeh4zG6KIGPIUvolLXq
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr14437633c88.25.1795486474639;
        Mon, 23 Nov 2026 18:14:34 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm18872921c88.4.2026.11.23.18.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:14:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org,
	vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: Re: [PATCH v3 0/5] soundwire: Fix bandwidth leak in multi-link aggregation failure
Date: Tue, 24 Nov 2026 11:14:26 +0900
Message-ID: <20261124021426.424452-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
References: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
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

Hello Bard,

Tested on a Dell Latitude 9420 (Tiger Lake, SOF IPC3, Speaker
aggregated over links 1 and 2) on soundwire next afd88e7ad781. With and
without the series, all peripherals attach, playback and capture work
on every endpoint, 40 start/stop cycles of the multi-link Speaker
stream pass, and pcm-test shows 24 pass and 0 fail. The aggregation
failure that patch 5 handles was not hit.

Tested-by: HyeongJun An <sammiee5311@gmail.com>

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

Best regards,
HyeongJun An
