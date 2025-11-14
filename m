Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8F2F6578
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107142; cv=none; b=eLVexgGtnWkAxXKeeQiABUnwckq4Z4PO35mG/cNd8HNcoS/tkWoVxGlgGDaJyTu7BqaWhpVVIWwlGNVIwOrwH2Cuu00cymXvXuPvWbIpIvn7PoHbDMNXAbZe8NnMHvwTdGEBuH5tiYjxMLhJ6yKA6nD4Rf8ujXVCYwdmDRwCpqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107142; c=relaxed/simple;
	bh=K6kFMsWtM1uT0G8v+wllECV6TczozdzJfUeJP9AdwjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lAZM59HkYimVnON0uPIdG4mkDATmlE6p0aRUdD7GhVLAK5IHeqMbvkbdVDZ/ZUl+n/79vIKMSNI7zBxTugYiVTyTcgKdnLXQRjYzcLEFwU8nOS8/WLAvbe0WMYzhQ5Db1fLfyCU+x7Rc7R75jhCUIpFXis9YNIJh7v7xNLTtWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=encw1fIm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="encw1fIm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-471191ac79dso17773185e9.3
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 23:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107139; x=1763711939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nZcF6rR9cWQwcQ6vkLS/sjYhQpkMylvaRplPyWi7Fc=;
        b=encw1fIm5oKHGySsvLo82gAcZ+KJUj6exNGuzvw1jxFejlQMu/lLjBx2HzZynSo9A4
         vLAaqs3rVpkaZACxoMT/HrwBDZYsaaBEXW3tl5a51awsFU6q0MGLuKiCfJ88LQBjbZmf
         j3nvlQOq0sx0b97rdK7c1l/2v8E9lOrS2NcQzvJpkiWVYL6kknFBwqAD/dbz3VOjbde/
         z9VvQP7UmXVkr9B6hgPvEVO/2shGuV+ucsJGYi2slOLgJr9W9EqiLbBCCsM2ffbGuoeU
         qyyrmUPFIFvbFKnCYDbQWVycANA9nek9LLr4m0D0XFVvFWAaa/6VC4vxA9auOgRhMxpT
         xdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107139; x=1763711939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nZcF6rR9cWQwcQ6vkLS/sjYhQpkMylvaRplPyWi7Fc=;
        b=sKmgoBSwMAme0Z8UkG64CE4S0oyg5pS577OHstuzIBSqPBi+c0jdmpxahEFuxzpCTj
         d6XLw3RFhzYwgVfGlXIdz/oJh/Lq24IIFgo5HEFs+AOeeSz2+pkBnWRuKnd3Vh4j7sS2
         Vx8imelwfh9r6meJWi48F9aVt1bqwiEFwPQ7MajShIrdBahkfSU0+EDv3BqkOWmNTval
         a/hphNo2KrG4PzcHQS5P3mJgkjkvWv5HckYwKKkRgBK7ei9Yu8aQwo5bM3VIVv2zFZmG
         LqmMZFoVzcwXt4NVnpJQGIz07c0MPpgyZqtb2Dx1OZN4HZRQhGTrrhk5B8RP04kRTHFo
         94dw==
X-Gm-Message-State: AOJu0YxR5mhZrr4ZnQalQridXBLr4qY025h1O3rVFODEoNTvS/OsZehp
	nz4YnrzYU/kqIicN0nsyd4MQ8w8gYnCAtLZThZ4GRLgnYVrvQ83DeFtM
X-Gm-Gg: ASbGncvzuxsivivKSfhgekWt3rU7drA1NKxocath0ywOopjLz4rIgOPVOl5Q8EFGm19
	yjfD2z9DRuvu6QJF7idl7beRFRBN0V2N6Ot8rNVVLtCKsd4aXFwRjzQf4p5PjfDTcy+qGv5Qt0D
	ehmyzvixs8KPtqa3rDADxl5EEXn7ZQiNkij709rxp9j/C6mP/4wvXSZ/iXcbtgiDQ9oFQbuj7PD
	KqB9eF+7mCxk/yJG0F8q0hHWYUmXVkgsyRWXXE4i4J/q3RQJfY0gS2O+/eiSmTJv+8wmgcIRFPz
	OpIyOg0QS4diFis1eQgynlm1YNFAqBcSDUGZONuKwliBUA2ikLjbqH5fxmsBkHek8NZxcOik6Cg
	inUHNC9Ck9egp27TMqKxA/l00rYjAKVel2zvUQ/J3SmhYCmOHZT2D3lvvBH5+s9tF5wxs5VUEoy
	oHOz2DH7vAF8qWVrexx4oAs22D3ea3ck+hqu+tFj29QcKtNG1GMsl+il4UL7ga3QCG7v3nUMSRi
	JW5PZh5/OI/1MKr
X-Google-Smtp-Source: AGHT+IGiDe2czH2Lo7OvZs+3cOgWuuEQwOYNbSwWVHCI7obWE90KDolM00Q7gem4K9/2rVG6uqhESQ==
X-Received: by 2002:a05:600c:4505:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-4778fea8810mr21552705e9.30.1763107138936;
        Thu, 13 Nov 2025 23:58:58 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:58:58 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/5]  Add {24,32}-bit sample width support for RZ/G2L SSI
Date: Fri, 14 Nov 2025 07:58:47 +0000
Message-ID: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for 24 and 32-bit sample format width for RZ/G2L SoCs. Apart
from this, the patch series includes some code cleanups.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20251114073709.4376-1-biju.das.jz@bp.renesas.com/T/#t

v1->v2:
 * Split the feature patches separate.
 * Updated rz_ssi_clk_setup() to make ssicr assignment in single line for
   24-bit sample width.
 * Dropped checking {24,32}-bit sample width in rz_ssi_dma_slave_config() as
   it is taken care by restructuring the test for 16-bit sample width.

Biju Das (5):
  ASoC: renesas: rz-ssi: Use dev variable in probe()
  ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
  ASoC: renesas: rz-ssi: Move DMA configuration
  ASoC: renesas: rz-ssi: Add support for 24 bits sample width
  ASoC: renesas: rz-ssi: Add support for 32 bits sample width

 sound/soc/renesas/rz-ssi.c | 119 ++++++++++++++++++++++++-------------
 1 file changed, 77 insertions(+), 42 deletions(-)

-- 
2.43.0

