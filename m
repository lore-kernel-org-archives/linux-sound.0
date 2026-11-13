Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573853;
	b=ZuJFw9FT8ZKcE1FtVdIBa9J511cb38BEHOeEPb5WTpoXR8C7NMUqRmWH93AihPrY7z2S
	 SqbRq+XuuUvGnvk8CesxEs3zFJg8kAs595B3Veqrlm46PhZzSXs5Gac6mcvHhwCwe6FZJ
	 QWPeNI2Xb6qLFv7acn1gBbT2UkdCPZ5lQIK3HjfcD/jd5tjJh2a865B4G0/9S4094MUs0
	 MlF81gJ1llwEJLMbyp/lQ2qnUMOdy/Dhim12+Sm+ivBCEuBSxmUsPdUwlTDPO7y8+GjJo
	 Hrx8FK3gHtvvq/c5lQKtjAsjvZrpqwBelKoqKid/SfS2zNBfPuamOrURoMwFTTejhWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pMOUnEce+C5mclnZmcyWz+KKwfqvAMI7phNLC7162fs=;
	b=BxBaXedNnJYG1t93By+LjukEkTXw0JQeiV3gGw7IcL1idx09GyEXIpoJyF09twCpM6Sy
	 71Cb0YjqO0nlG1pchUAEp5E+oL7R8yj04RxhpjzbCsVNFqp+1Z6/tUP5XcQ3Mz+OMiA7r
	 W4S2bXLGRF0dmTBnlxfCiqvm9pMzHEPVxTdBvy924ebjgeyrpFsESNmUzg0V8JnqwMBaW
	 +w71kzKXNiiyA1HGPT81kZYlr3qWOwhpFXBiZQik4mpUh0DzoF70sVG7dt+/AGaCNZDaA
	 SxckbUqVByb5dA6w+TWvEThrQHgtl/owhgjvQc68ebrsrp2HqJlyEF1MDvv6ZqvEsNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SqouujRm;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D133606A332
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 12:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D133606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SqouujRm
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922523d1afso411742f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 04:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794573851; x=1795178651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMOUnEce+C5mclnZmcyWz+KKwfqvAMI7phNLC7162fs=;
        b=SqouujRmOp6mwjQSswLm8pvzzUZucHxJtA+PHlOCjU9EYVxdFJ4GBTtmi1y7BoR/9O
         7dA9gOaZ9SehAi3LoG5f/bP/s5udoq2vOQRU5aTYc0HEd8eZQRymcQ5ACmdG8asiH0hT
         q+1pWmfbrOSJ41zaKc5DlLRALIK94B85kO7vzO/E1zQGZLDmH9pdQvE83j1C4rzGXqPa
         pwxIZy5/qBJSJwRqs7lF48tohTKt5pNplkCmlq8g74+4Gvd9JHnCP14rIXkhYK3htIIF
         ZiLPNV4R6OvL9vAfgzRDRLqZV4fWzVXZ0MideCpsdHBs+em/PluWuoslmmx411xo7GEI
         +Xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573851; x=1795178651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMOUnEce+C5mclnZmcyWz+KKwfqvAMI7phNLC7162fs=;
        b=gYF2TabeMg+2vFdp7HMrDucHVPRf3g4Sxh0+Ov0Iqszzb58GCAYdbhAKjpYfMyWVj4
         RVSJnLLHFeiv34hJhECg9TuZMP0RjeI1HJAVjKDAIvf1T9yfixhsG7lJp6ktmAFO3nTy
         /OjyPYI/cOHjmLM8frlCN1HojNvoAEYsM4iq10LiMG0pRbvh1bKyZRXYVn1VgdcfwGyd
         2se5Hf8lZQSY9OKzRsOTm4fh7WiFjhBFZ8G23pk1vmSa8HSKYDC3at9ozVtcDRv/CrGM
         oaBz5W3u5NAFFq52YTXWWGz8Ppnk/1aISR9M6pGT1ZuyY3okWjvRlQZfuRSeaYU2lXIo
         OWQA==
X-Forwarded-Encrypted: i=1; AL+hErFkNHK7HGRZ1VzU9eP6JlLCFAJkwXzDp4iUM/VYiQ5+80BseeQKHIFKNdYpiF56jQB8JU5mMJG2qv3oGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z++s5ugCfMSGC0sP+ERvCs/HO6IO7SOsATD/BILlKkHoNeGhiz+
	uHTxkFeKXLmKLBWCZH50DXq9iYXgucJemiGx0VT/rLSofQM/QpPwlQU8
X-Gm-Gg: AYBFou1dk6UDueeDY/GqWjSXUQqXVuRsTN2DRngnmEiSDTlzOB8naUw/JwJhyMjzA0e
	a2jUeO6J1hwEsbQyvp7au8RxZyvQ8YUnZYETSCINEbSvtyyyRoU4Ob3OzMIwkmSi9kegt8ylXAW
	h0SwF5U3XRW28fzDae4uy5aTbE+vfMQ+/GUS4oxcZxr+RftB8zWq2ZY2mdrlQSCG1zjfp52Pj7H
	/pIcNtuik0M29MCE0aaq34eFkkX91Ekr3SCwmTzpaDgzoQN5GbfWTao3HCRg0BTibC0F0ee0LKp
	ecmdVVIiLYNz0tqmyPEnCr6mA5766slx8voZXp0Oy5cZsLh4A9Gu9zw3hpa/E2zfep7zK+adYLS
	j1jcE/CcMLhFtWlyTF2BcOVB4upLekVmCWbrFlRCA+V9GutZhtBE9VwL91Tv0hJqiVyDx8ai/0c
	lnvev4Ur6haav4xKtguXMJG0jRYjZjqOqMqF//ju+1oriz7eC4MOS1ereClDtDkVRDQL4GI4Smn
	IvlGLqge4bczglq58yqW18iRFZ0ZpzhHOEDtCrXCtluzrnuX3XxFt5cVs8QTDIwqd+1jMROR8U0
	qy6q9NfdwtJqoebu0/zYbUnW1xol4Zs3yxEm7+aDZCASlMjDWI3i+PNq7I/aT1jQSMp8CfSX4fz
	UtFUtBbuZfo6skB/622Fiojj0Rfx20Hg0n9fUTC4QWsY6qf28pKTDKZ/mB7UHaxpL4qlt8XjA71
	tyXHkiWut3AhVu9WC2pgEK0HHVvypxzfPyqQ3TS9aiccFmnQaSri04kQxseZ4ZJHz3uTT5EqvKv
	4EWs317qDxmHzjU+qpRA1ove19s8gvyl5T9CssE
X-Received: by 2002:a5d:5d07:0:b0:492:905a:8b22 with SMTP id ffacd0b85a97d-49c6fc9dc00mr5932250f8f.2.1794573850456;
        Fri, 13 Nov 2026 04:44:10 -0800 (PST)
Received: from px13.tail3a7e86.ts.net (91-201-160-62.ip4.as24916.net. [91.201.160.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm5037179f8f.15.2026.11.13.04.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:44:09 -0800 (PST)
From: Lee Mann <leepaulmann@gmail.com>
To: regressions@leemhuis.info,
	baojun.xu@ti.com,
	broonie@kernel.org
Cc: shenghao-ding@ti.com,
	niranjan.hy@ti.com,
	antoine@montane.tech,
	andrey.golovko@gmail.com,
	pierre-louis.bossart@linux.dev,
	matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status check
Date: Fri, 13 Nov 2026 12:43:58 +0000
Message-ID: <20261113124358.11823-1-leepaulmann@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
References: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
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

On 11/13/26 13:07, Thorsten Leemhuis wrote:
> /me is not sure what "this patch" exactly means (the culprit?)

Yes, sorry: I meant the culprit's approach of leaving channel selection
to the DisCo table.

> But if not: Lee, does a revert of the culprit fix this?

Yes. Kernel 7.3.4 with only snd-soc-tas2783-sdw swapped for the
v7.4-rc1 tas2783-sdw.c with f42fbd560cd8 reverted (the revert applies
cleanly), stock snd-soc-sdca, no fallback:

  speaker-test -c2 -t wav: Front Left from the left speaker, Front
  Right from the right speaker.

The kernel log still shows "function type only supported as DisCo
constant" for both amps, so stereo there comes from the restored
split, not from the ACPI table.

To sum up on the PX13:

  v7.4-rc1 driver                          : right speaker silent
  v7.4-rc1 driver, f42fbd560cd8 reverted   : stereo
  v7.4-rc1 driver + PR #5904 SDCA fallback : stereo

> Or do you want to maybe open a separate bug in
> https://github.com/thesofproject/linux/ and see if that gets things
> rolling

Done: https://github.com/thesofproject/linux/issues/6037

Thanks,
Lee Mann
