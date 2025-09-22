Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90495265620
	for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758553495; cv=none; b=VUrXouUTMTYUdc3uiEKr2lJlFoMTv4tIzxKsw8GND8nd47R7IyG/H7cDBy/SD1T2a6sgtGp1+4rSDsjtLiEZPv3oor4IZxnZssl4IAwgUZvM/cbRxi5QQoisB5mhGeYARBreKDn0ci0oadoUAYqe97Nc6chaUun6Cq7rrdDqlk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758553495; c=relaxed/simple;
	bh=F3TQtbkViaiam8gUJt5ndCncukrSdnsgNg2kTTZJSK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eU7EEJhsBfoKwPoDzg0T1SajEkM7CzSnZ6Bxje0PnxH7Tmq3duW7YLl5s22sQv6IHEMOocpneirn/zAK0KyPm+khqK/ZKkjbMnOo5PJzFKjlzhZpFY2BzQNXlq4hLIKwO9BmQbhM7NIWlGqcW6rgn7deHKqlqiKPqSTnjVBnFZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtmW1BKG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtmW1BKG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f2c7ba550so1260955b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758553493; x=1759158293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=;
        b=NtmW1BKGGXMF4akKDR7W8Y3PfmjDMZtzHAxyMgSBdtVcQyd+6B5f+Nj+v7Xk4DvqhS
         QwZzU3bc/2wWI6zpVqCNUZyZamT81yzm5FEe863uLw+UoqSBC9BT23aeALwkgvefQChl
         PMoe59/atJf2iQg3NC53bNUuONEWjIgFc5VQqjRfy6YU/TApf9E5Nxtlcj/aP8Js60P7
         ZubE89DEB1fUrfabpCP8ZxBWdz8D9HRLHgrvUs6auqKvNQdVMZv/on65p0MXB+km4KSv
         PlUpv68WyNLitxpzGXrhZgpFc9ql7Od4ch2AqROWBeJbBf2ny6lrNAgyL4xzgwX/D3qs
         Y7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758553493; x=1759158293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0Wzhr2GBiLR9XupCOurqAE0qKgHtMmqWf9RdNsZ+l0=;
        b=LwUJfwTbpiOiC+A5UOd6nxoGKy3ojNlIPmdeVo2X7ZABbkehOUx96YngYJN414OaVF
         Leb4bV9Xe6gk7x5EaBKnhRD73o2hFBPyEsDIWuBE/zLWrMaw8Zh3gvLWXjnOp6+b878v
         cEmrvYgkaDPIv2PcL+uzR5zvp9Go2wZB6LTu6GdElxYRxb0PLHRJ4nf/+bucZfW9zLrU
         RVksynnmLPFJd21vPBpm2jyQuvOruKWutk1yFmvKfnxMz1iMQjVXMSbH+uVwC6j30KpU
         zUPPi6lgDGG1w3htAxnT2UUjWcvlKjkIKC/XJ2XJb2NMWaIrmeINgAKVtn9mHI1AiyhD
         7kOA==
X-Forwarded-Encrypted: i=1; AJvYcCVcL3kDFYzMlBtRRwnULYi0qFKtt+3jXD77NdZuiKuOKG+iQCflQfBLBn77OocKJfTtLYKuoIvfGLQnAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9wFq9tHlUg9Vt71KFdYUG8F1XHETfpQ+N8SCpX+ozEIEDGvCe
	FjDjg407ZjAU+rSeA/zgUS5wvXBN+sl67hS8cgrBFzNzA3PvUN3hoWCr
X-Gm-Gg: ASbGncuiXDNfARdhsE7UWcFI5E/1pa0Y05jRYamMXLu2dF+wl7DIwmXAfydw17HKe44
	WOA/hGlzurS7N5YDsI02+4VhkOfgosop+yhsgv0Tpo4MCpLsK9XLejL2K28BWJ0JxgS7WUp2V58
	GPWnifo5KkP3u3SJDc9uZllykzW6i7hzxqumFyULVxICHCrZbRVaQxUJIqGEfeKHJqq+RHyrK4j
	kJbxskaxe54Hyw8fJALSfRifDTYvfDtdrSbE83EIuUM/6PJRH9JFCgmyE4EMSAWJFedt6AueKMh
	aCAxMGmp+9QGjoiz8gKmRMHEamYDYE5zeAIeJz5WUOY8FkYlsWTXuew0clqDnjWpi9iKNL0gS5V
	0QT4VEN3BMLDg7ksBqhb7Dw==
X-Google-Smtp-Source: AGHT+IFeAHlS4iAJPoHh7ZOm/cwEens/eNTaBkhmdeLozkDog20ChhiRrPA5x5jaDTgoFT+gLSoGCw==
X-Received: by 2002:a05:6a00:9289:b0:77f:2ab3:32d0 with SMTP id d2e1a72fcca58-77f2ab33626mr6873061b3a.31.1758553492759;
        Mon, 22 Sep 2025 08:04:52 -0700 (PDT)
Received: from lgs.. ([101.76.246.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f315029c0sm4101850b3a.47.2025.09.22.08.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 08:04:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] powerpc/smp: Add check for kcalloc() in parse_thread_groups()
Date: Mon, 22 Sep 2025 23:04:42 +0800
Message-ID: <20250922150442.1820675-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As kcalloc() may fail, check its return value to avoid a NULL pointer
dereference when passing it to of_property_read_u32_array().

Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 arch/powerpc/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..2da064e00d0d 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -822,6 +822,9 @@ static int parse_thread_groups(struct device_node *dn,
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
 	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!thread_group_array)
+		return -ENOMEM;
+
 	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
 					 thread_group_array, count);
 	if (ret)
-- 
2.43.0

