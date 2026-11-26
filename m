Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674119;
	b=VCfC6KJIYaArueoD0cl4AiB/Z130It3YEk8RbzW+L2vKWk6t95+3LbxgXkxY97BskGrG
	 HybYHf3l1V+fUxS5X8oxTTtNA2sUPtFjy+FKxrP1s/q0IZej3NQIycOU5pNdTG+GxI0hp
	 CEplBnmRmjr3s42EA9SH7lvRalQU0GATF2Na4fZuQi6irg+f1bGVa/wFlK5V+LD2R71Zi
	 ljG7QYeX/KXTCiq/Ih2IlQLpgatnUmNpdNgfx0/rAUkOACl+TT93Hwbz2p498i36flZ33
	 rAtTPz9UPFIFdBH8NUb/PWFmoD3K+DA1ZhAL/ZrvBNqROthS4bRMvq+EMVZ9IjlreVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=lCiug8UAtvbOvIxRRq9scfmGlNZI+7Zn/ROzFdY+xKFSOKGCfv8/qDzzEfSGFtqGKxtJ
	 octJzyFwPisu9lGsWhoDVJyAIQtkogpnWj5aIN5YTAOl5tOqivK0GVi6V7YRuNbsmTMc8
	 xoHVA/m0JWGPC2RkyieT27p5z5KMH2r+xzNNAzQybjBeWHkIqZ58QUfNmzrX1Vzb5YLlc
	 ZLQU/rWnT5yC1GSp/VW+Kc7VJLQ2EKvRTMe6S0hkh2sTyK7glQegBf932NdXrKDxVT23q
	 XzcueMaqPWRzdD6sM4zTdbg5Va0xXRalgEwNjSNuetfsdjK6l3//YKEotajD1HO+/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBOlt0Sh;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC78606A32C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 06:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC78606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBOlt0Sh
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3863db981d4so9367369eec.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 22:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674118; x=1796278918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=TBOlt0ShMJI3wfTq9QyENhtp1fWb6gsfF9AX4VrIonYzM+1uOvRyRcGDixBZP/S4+q
         rLYfOkj3zTL36J2bjepOuoPZJhxy1XP3Kq+BOZ9aKvqSSHqnDIxTESAhHXre7ol3Hmbj
         LZrZyTfac8O5eMy44jE68kojUrpTWPPivMK4pEp1Sn/zf6KrYM4Knyc9FuF3CRusOSn5
         OQtz0XmEiY/1ek2vEcjOnkd5f/pfKTklwgd7Kkn+k0u7dvxrV7+A+bFyUNxv2aDuK44f
         jsceiAo36ZYurkLvke4Fj573mS0buslNAu4JVeNg/+3vikRPxfxYeDzec1oAqtZI92BA
         h+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674118; x=1796278918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=z5NJTstZ/xGLJV4zbxF235HafgBbSGJUUaiH0J32L4LplVQrTji/+XZhzY7413T7W7
         XXTaspWvQQWNFbZtQfkFL1m1hhiOQfSbbJi7wcjV28NEtWGlO3ep52jAHx4rCdivL51z
         +z0poX/Rgz/LjDHq6pTZJm53gpEhLJJgncaUOgkEE3C37WqbQrkMxN8MBrVWk1idohB8
         pQJBnHYAgh38gy7X8ImSzpQuHrL4Q3EYKjC7+wgoY3rXllblYdYLve7Bmf5Jn5/jIccf
         mAB6WIewc8tvqqNdDL38iM8rPNb0USkJV/mxHJpkCdxF7yw//igRogsk6c+o6PwXjBQp
         3BCQ==
X-Forwarded-Encrypted: i=1; AL+hErFCTxkgZDmSB927+0vtfICW5Ou+wFF2iQJtso8Xv157cVj/rL3K7q0VRYNUnTPUbVUCnjjW9FwHB2Ci4w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zh5Fp5S977IqDBJJxtE+5INiZtWVR303duiDhEUpcqqyAXRrL
	TDGFhr5EBCQhc2ssyJJjegRrBZGxT3jJrvtM+PNAtLHIwfpIh98J5W4S
X-Gm-Gg: AZFdTZf8TmMMbcQws97ajBBM8Mbnt7swgKld98geLBNehorVXbUZfccT4u+RGzUcdq2
	1yNHAgNotktjMXmbZYArHa9innO4l5h0NZa1dRKNIAhhW5SAfcMNrQ1jZiT1+0hQRxphmpWQUqG
	/0b/LK7nTZGatjjUCrG8zWtSjGNCrlXWJc85rWSvJts92I0HxjEboF9f+wCVR3sQWjZJy3V5jx5
	KnDiCloEkdtLtSodyi0NJ3xGBKPEWwmI6uQ1DrDCj9rTfbetrv7oVAXWfkV3RZqE1Lv9kIhqDPX
	HKK8e+pzeqGRvPyMKCinrmAysCEQiG3HJ1trdHao3JKjePcc/D/en3KpcMgR873mK531U4OgXkr
	sixt+l+aeinVyW4NIpGoM6oDc38DqWxFp9DwAP8PyE4ZBvxR6q8PZfoFNQsxZ52ePLeW+cQ4Uk/
	WooWTTz7I3IeU0QUY5U3HtXw3o46a+jNdNCDUzZX7G6pkzvyOfoy90UBuGhpcbRnX19hq8nqes/
	zijhiKH5iVRpLEjEAUEG/v78Hjxpk/9sWKAO8+8KWBDxxEfeFbkjGZ9qQRrsO3qVPI/gyarjfGU
	LNvytXHCRRUwZIBittCGyY/jjXR5DCuQsVFYXhOhpw0tnpgEa4Q=
X-Received: by 2002:a05:7300:89:b0:386:c880:19b1 with SMTP id 5a478bee46e88-386c880248emr6128397eec.10.1795674117868;
        Wed, 25 Nov 2026 22:21:57 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm61262563eec.6.2026.11.25.22.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:21:57 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v4] ALSA: core: Reject zero major number
Date: Thu, 26 Nov 2026 06:21:32 +0000
Message-ID: <20261126062132.2905-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87zeux6nkz.wl-tiwai@suse.de>
References: <87zeux6nkz.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
