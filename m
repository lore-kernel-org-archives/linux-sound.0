Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385175;
	b=eYckK3oGTVNp5hw1bDaPsfhTSPDHx2EX3TIyPh7yQHTiV0Ooix8j2SIi0w06oMwh8abm
	 5UdvdAAR61mpYg1k918qZzEZDqp9sYUgELLhVIvvTEswP6RmaUvLlskguyArdXICL02cZ
	 wcGS6N/7rGqdjQF2JMsK+39NWV//mNkIvePaOGpbzE0R48IoHGf+0n0XtJI80ZuXu7nI9
	 itX526EBcVxMnr9SJMS9vVX6Y38C0DBfqE4Hqr7l+wFvKAeYhGgjlZ7oz+ns2mMP4gEPx
	 HXfkyUrvUkWvYJTY+5dLMjxmJy9QJVFjIeYijC1MoE+tR7CL1zG59VdLFVA9WEXfAWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T5ZgfcjP6PpiW+oPtLSGPRYDPLG9qZ4FCz1XwMujgc4=;
	b=IGmWT3f/BiLfb7q/jMIUMHsw8vP5WDMQabgWlg8VRdosHAW72BbV0171GRnhO8KbNkzv
	 nABUeqvggIhcYItW2e0TAlc6KkD6ruDipnqrSA/3xMTQSOstpMj4zTq9DFzf3qlG2mKv/
	 8XHlmYCzK9d0O1lwgDqYFTzVGQe+/s628BU6sb3VMvNAZpzIqBWMMtD/eS4rz/rhPvBbm
	 iomVa7ndkZBnntPcqRUt5OAxuvwcAS3RIyHOdSe97x0LUOSRj5biKbTTc1sGu9Y6BPAd2
	 TKasHp/ptte5xg4y+czieujBp+lvyreVjS9cfszMTzAeqhl8I01+30UbxyC/O6BHw/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LtPUTen;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C29606A31E
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 22:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C29606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LtPUTen
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1182157f8f.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 14:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795385174; x=1795989974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5ZgfcjP6PpiW+oPtLSGPRYDPLG9qZ4FCz1XwMujgc4=;
        b=0LtPUTenhOU5RuJ+DxTVK1oJnrg/VSBukWWBPwQ+UlAg4J6RUi8TzkriEONa3wdcBP
         pbBmeat0uq1MDQJkmpDDE7w2rVbgFhgSGo8SDY9jA+UlqfzlvXDUmxwU9dJLgiXM9s4Z
         WMh1x8wP3ctmgnihihNY4qvfmmvkm2cweNcfJR/AuBq5jt6duHMrpJo+yVH2SMOB9Zv6
         kxtKQN+go7kE4ywB1Ef3LX1sFpnRPrC9ehgyJ8LAguwHllJNX/y0GwUQd70+bMAsM0uY
         Mna8md83DcxDtOKnDzUanki2ARt4zEwKLst2mADVHwnNnCTuqxJU5mXzXQRS129Arrsy
         CUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795385174; x=1795989974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5ZgfcjP6PpiW+oPtLSGPRYDPLG9qZ4FCz1XwMujgc4=;
        b=aMPQf4dFooZs7cF/K3Msd8hD40NB0ASkKZz1KGTU3sH+j0iW+PQ0dJPfK2F1x3pv0T
         WRAImWR3Q2epsINqjjnQ24BWemmHl33KyPLym8u4V46XWX0R7wOLy3NJJpYlXZAKwH2M
         1vqd2iKANUcv0kfju6LFPrmLCgpZlbsFr3Zyis0cpxCJIhphTE/z5DJSaQ+PKE/def56
         XtJMYWS6+zc/hSKv0UJTd4DCzvbUxrToBJg94gv0ZbMcJC42MQa74KhwvsXj+O8K4i2E
         Pm3c4bujVtNcyMXxgrn4AF0tsb5pk8+ElItiMycCSDtNv3l4Xk+V4Krw38ncsFZ8DcjZ
         RtAA==
X-Forwarded-Encrypted: i=1; AL+hErFYxepdDyK2WatZAEGur0bF0LNkkSe/UeiJyQnIvogx/eleVfKlqAXV1FLMtR8PWAiu1Q6v2ICKuGVIhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z83nhLiigcViQS50ghGAnoMLQdISkNwYWjI2N3MPDMIg6pxnkdr
	eWO/pSXJNTqzEKZpJ4U4by23MM++19xhEgUoyoStBPmc5xY5mThkLkvc
X-Gm-Gg: AZFdTZf2m9A42qkqUgwbNHt9KCHTAJaO5A9QSf8L3lq/5CrgwH531dqe2PomeEr1jbF
	k8ylhGhWyxExnnNYmJZ1NJsmUUutshigyUmZYWfmy/KkgwX5NfwsRfjjcD7IIfSXolto6Ez0FuA
	sWFc9//yTCxdIVJlpfm7BvXQ0nLekw12iC7eD6SndOHBUwsWhyxx3DVFjvLMlj40WfjKHZtF8aH
	c4YWnKQMz/YqknELkcfMoHSULTIr6ZiN3sBFauFque9v8gh1uQbtMr6a6L5LmP7ChNWaUV7MnDS
	4sYy/w4m5bFofhd+klRYXNsCwfHnlN4/P6CLJyzAgxHiB8GptZkxqjSKgvYf+pWSFEK3/8iSPbz
	DKwR60EKAXmsou8qJqiMKMCyLMQ05o1YhM7pyft4C8kXBgGXisU1zImXeWnQUzJl7rkBK+WeJkO
	XhsQpVUKaMXp0NcErPwWCN/4yrjUkUu7ea8I8B5km9BYSN+4D1ar4bALhnlOmyztSUEjXWqQUAg
	6OqXjLLOW7N4yDSRIj7V8qA1euY7pKNbcVN4vLeam9xWHxHOj71C2nVauMA3aqBX/S9aWBuuWNB
	JwyqfCzWEFhW1RiEHg4+G8undNLDTIgudBwhTQ7es696C5q3vaRk+fsb
X-Received: by 2002:a5d:5f88:0:b0:4a9:b6e8:7c6 with SMTP id ffacd0b85a97d-4abab02c3bfmr18963687f8f.8.1795385173636;
        Sun, 22 Nov 2026 14:06:13 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm17962376f8f.10.2026.11.22.14.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:06:13 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: aw88261: fix sign bit check in aw88261_dev_get_vcalk()
Date: Mon, 23 Nov 2026 00:06:03 +0200
Message-ID: <20261122220603.39282-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
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

On Thu, Nov 19, 2026 at 05:30:12PM +0100, Marco Giunta wrote:
> -	if (reg_vcalk & AW88261_EF_VSN_GESLP_SIGN_MASK)
> +	if (reg_vcalk & (~AW88261_EF_VSN_GESLP_SIGN_MASK))

I have been carrying the same one-line change in my tree for the
OnePlus Pad 3 (SM8750, two AW88261) since October, and the speakers
have been in daily use with it since then.

Reviewed-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # OnePlus Pad 3
