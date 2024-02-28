Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17AE22F02
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709105974; cv=none; b=fvksVRWNCSn60wUoPIiZpJ+OwJ5U2dyMWuV4mzlCogU0Ua8rBfkhPp6Ur1831jQxNxh3sGsRgKMCyXxXXFgD1AXSfIPiGOQq+UX4nKVvJMfuDAyvl8WclzpxziNHc0l5tnqAv68gjxTnYUei6jn0sjt2heOy8q+NywgLjlKTryg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709105974; c=relaxed/simple;
	bh=851+0y3kCXb+s4VEQeYlTsb/d7DFFOe39J0KhzyUK38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jPRcLGQ790wr7VfhT2/5nnUkePvHKijOG0T0Qf9Du0O59j2dDvFZX4HB0l7ZM5EUkncp6t6UWY55tHLxDRcDvR2wv697mtlT4dil10YWOMu96xMymCQs6tNq3v6X0TPJ9D1FDCI0jCQU06NOuJBbXGgOd4Fi7bfEQuh4CvvOqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=HVIwNPIL; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="HVIwNPIL"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1709105967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hK42Y3R+o00YFBay1MHIpPCN4AJq6m3H5mLk1XVwoVQ=;
	b=HVIwNPILNliDDHU4Cxpf2pvrmDxCo7karBwagvjulkzIluqUBpKSTbBkUB7ZzCZ9hAcL16
	Hedv92VvOvTOFjmv/UYhhoE5BO6y+1ZtHKhAUY4B+UXIvYQ367VDvLqlZlYRVNsk1LFZrq
	KBlmqlUFVMaEJdghSbTQi9zR4pB9PhUcWFclIUcxIhCxpbcezqmnKbsjBYse0p9KJkylz+
	Br2G4sgK+YIEDMAf1ZhbmrfR5fqKA8zhRqbQbL6oIh5UdOcPXEpUzeCOs/c5ULU/4p35bl
	oa1Z32TI6dR1apjdcDgy1TBxd+XsncUv0H9KXobav5sRxaXaYghD8/n5EOAvjQ==
From: Jiawei Wang <me@jwang.link>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Jiawei Wang <me@jwang.link>
Subject: [PATCH 1/2] ASoC: amd: yc: add new YC platform variant (0x63) support
Date: Wed, 28 Feb 2024 15:39:13 +0800
Message-Id: <20240228073914.232204-1-me@jwang.link>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The Lenovo 21J2 (ThinkBook 16 G5+ APO) has this new variant,
as detected with lspci:

64:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
        ACP/ACP3X/ACP6x Audio Coprocessor (rev 63)

Signed-off-by: Jiawei Wang <me@jwang.link>
---
 sound/soc/amd/yc/pci-acp6x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 7af6a349b1d4..694b8e313902 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -162,6 +162,7 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	/* Yellow Carp device check */
 	switch (pci->revision) {
 	case 0x60:
+	case 0x63:
 	case 0x6f:
 		break;
 	default:
-- 
2.39.2

