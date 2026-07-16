Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DD8231836
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201676; cv=none; b=MAjKa86PEiaVxnQ2OiVVtnqvHj10DVZaZCt7lggUziw34utgFaSTqfFUJCN4M6d++lrAKqTQtykJj/ydkgwSt2nUdjHxBpT3Ye31Na3YcbNzcSEwAy013pON4wMz84yoCkPnoUx5bHEiBi6PdrO6E4Hm5H14hgWmJ1HyI+HlW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201676; c=relaxed/simple;
	bh=IdJRopiMrmiPoijBL0zLYX12rXlo+7INc+el12IShc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFbBKTtyOswj0iFt7rvFzWMgAzrNbCmNjolzayMY9sYd8wi3isgNiWqr/0/TJ6MDYxs4e0ke33vN70j7N2ch9u9KaP65iNhL5m1kU8CeCy3rtgBp0cGBulU/Bm1rtMl9uvW7B33TlMshdClCYn19FuNxAhwuYUqWcTHqgGbFtqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkcCW0mX; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkcCW0mX"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-380f4166f80so1843664a91.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 04:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201674; x=1784806474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IdJRopiMrmiPoijBL0zLYX12rXlo+7INc+el12IShc4=;
        b=hkcCW0mXYiqGSdxN94GIQxI+KVX+aFqRmNElhsb/mkabDhQNPIgzu6iHm2RMism8F3
         rWbmvNjUZZ6GdQcZao3PjDHA85HAQ+syHtbcldJaa+tIGVGbq0avQmtlzkg/G4xdYlXn
         WdpXLH8cSkd6xdUMNhNO/8z16uOEnSbnr+geBYpRYqiEXFAGerVfFL0+3sZwetJ33cwj
         smBZmtnuHO6PxgD1ougMnSNqaXH/Fc+TDY4kWMJzyUis64oBbyW8bb3myPDkJq9ZONUt
         46WIcoYPv7OfOD7suEn763vF6MxQFulYk62/2kfTETLdMNq/ehU2DnnC0CHhHqbm8Uor
         gvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201674; x=1784806474;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdJRopiMrmiPoijBL0zLYX12rXlo+7INc+el12IShc4=;
        b=ENqZrfBUBybF7omshIxcjRzDw8+z/W/LPht7NEksiwv7BgSd6lYW//Kd4hqRZWLHLX
         qx258q55j7ZvrmkpSg65ntLN47UbufvittQlzM/wYOiSxiY4Xs91BezIKVZd1etKAOoO
         9xqVkJ8lrlzw4pTQ8qIIlwA4PNX0bCDkBAGP2WpYEB+2fdWiHpJRSwiicwY4M4lhBWHN
         o6dvnGUngs1u+WuwWVx5/sWNpxbiCHGTRxumRUWqjpUsza+xzoA37R+mKbXATSf2W+By
         PTRe2ZXVOCtjLAdBIUqHFjEHQzAKjIoitQ5h4i1VkIn+f4CMl4D/D7U+Wy9WZpAU+2T1
         DBtQ==
X-Gm-Message-State: AOJu0YzCcho7xHq4B6FT5lXRfvkFjV06j5qwNPCvePDUqqBOqCucBW1o
	kULVR5lqDAjwRXU3uaW5ggvIBf1tjKW5BjnhgXginGy9FPYKwLQ6SLMVfKxKLwHlvLnVYg==
X-Gm-Gg: AfdE7cm2KpizWyekReh+j27TRO9ftE5hFDugomhw9Eaz6fzDpS8m98uy+PwUqmpwt9S
	hOHXvPbBi6P3Qd9haddTn3Dz4ZPTwXWpEN+/ElWxZR+yHK8RgLVW6gcOaItpi+KXqVu66B+nekU
	M15XM6xBktkrxa+rUT8Bo0B8Im48cngjaTHUInHztLNyPYYo1Bx5NcfWWfE6AYijD2j4zN+4fsf
	BDNZORFKGHxU7QvxEtjVUPdJC2Tanuiddmsk6mPNG08xLcdivb9tr0OYvudL4wsk04NOtNrmz0Z
	hTgBHB8D59ma7xIEZKjeXkgJvF1j40x7mwvE83iT2gckTwMf7obm6Nz7yxk2wj6lMSABmAd1+el
	Xbjn9qnR5y+pRinORDvF3rrB3WT1pMYGpd8NPPJ7iFqapsprFvIJzb9doxeqrt9VVCUgemWRyIW
	a3/PKJR0z2gptROl/e1WI=
X-Received: by 2002:a17:90b:180d:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38e120de0a5mr12677181a91.25.1784201674167;
        Thu, 16 Jul 2026 04:34:34 -0700 (PDT)
Received: from kuangyufan-EndeavourOS ([113.73.176.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0d7bc6sm1157813a91.11.2026.07.16.04.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:34:33 -0700 (PDT)
From: Yufan <kuangfan955@gmail.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.com
Cc: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Yufan Kuang <kuangfan955@gmail.com>
Subject: Re: [PATCH] ALSA: hda: cs35l41: Fix Speakers on HP OmniBook 7 16-bh0xxx
Date: Thu, 16 Jul 2026 19:33:45 +0800
Message-ID: <20260716113347.95616-1-kuangfan955@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87h6e8fk7n.wl-tiwai@suse.de>
References: <20260716101708.86725-1-kuangfan955@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yufan Kuang <kuangfan955@gmail.com>

Hi Takashi and all,

Thank you for the review. I missed Sven's earlier submission — I only
searched the source tree and commit history for the SSID, not the
mailing list.

Since his v2 patch is identical and predates mine, please drop my
submission.

I have tested the identical quirk on my HP OmniBook 7 (BIOS F.12)
and both speakers work correctly. If it helps, you can add:

Tested-by: Yufan Kuang <kuangfan955@gmail.com>

to Sven's patch.

Thanks,
Yufan
