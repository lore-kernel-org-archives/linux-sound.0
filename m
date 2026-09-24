Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC743D9527
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229205; cv=none; b=BJTP1SgY9B4YhgvacNtQVv1EfvUYScsZBm3SXcrzVwzdAq7n/MRxe52D447z1wQz3NQaYI4GqhSTWZvlxRioLrH90recL3Jl0CuTsZRyL8mJNEBrGQIE0TOCIPGfCnVfuhJJCNpDgdC3DmWwdPghgms4rbiYGfSnn5OavY78QnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229205; c=relaxed/simple;
	bh=rsAwsvwe4h0uiIMzAG3nfHuO6YmFV8yQDIrjIJgfAPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOxRFtFkGdBAQm5ibXZ3WYBff0UaJzpn9tiDHUGLb/N4tE5weMhhaudi2U6Yif8FMZIUqWarljtOke0Ly80Birg78Kt4tB0xTr6pgEdJtMYCOoaBog3Vc6aAwH8kVy92forrFuvLa6rww03nm5ZRP36EgiQXXtsOJD177m3oOCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQmFazNF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQmFazNF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84D2CC2BCF6;
	Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790229205;
	bh=rsAwsvwe4h0uiIMzAG3nfHuO6YmFV8yQDIrjIJgfAPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aQmFazNFyv9dkwkfw8BhI6IcrBgdGAJ3rr0VZWsXsgDkzrHlGdFlSlrpA/tU9kaN/
	 sjRtfqCu/NY6wkoLjJqg80ENFQL+2xbfKhhnSdnnEIantf7mLfJJRO7qDPk2OIBSXh
	 DVDNGK3EPXqijQpPQ/XLs2C2AKOJHDXvc3T3059AecAj9wHCzp/AKx2YeqOMWX8RFF
	 y8rKr47uAZf7y9pOj1kUkTCrYt6HzCpq+UbpOrBllMVdjWnYvsI2oP0yRgsQ+czmV9
	 9WfDRnVGrybLGa025I5iO9IanAZ9RRqbsahn5cak7yqTGUBrhGWTdCSUf7fDfR5JYM
	 HR7V5158wRU9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFFFC98313;
	Thu, 24 Sep 2026 05:53:25 +0000 (UTC)
From: Shuming Fan via B4 Relay <devnull+shumingf.realtek.com@kernel.org>
Date: Thu, 24 Sep 2026 13:53:02 +0800
Subject: [PATCH v2 1/3] soundwire: intel_auxdevice: add rt766/rt767 codec
 to wake_capable_list
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-rt766-v2-1-e0b63606a5e8@realtek.com>
References: <20260924-rt766-v2-0-e0b63606a5e8@realtek.com>
In-Reply-To: <20260924-rt766-v2-0-e0b63606a5e8@realtek.com>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: Shuming Fan <shumingf@realtek.com>, derek.fang@realtek.com, 
 lars@metafoo.de, oder_chiou@realtek.com, linux-sound@vger.kernel.org, 
 flove@realtek.com, jack.yu@realtek.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790229204; l=641;
 i=shumingf@realtek.com; s=20260924; h=from:subject:message-id;
 bh=BcqE/gWuYULZgVfRl/cyCWha2hHxTRJOfhcwZccN2sI=;
 b=JK46BUbnobj1xIlSUl61xxNE9riixDgZJ5dOiPv8Vnzk0GsiFRgEzUD+E7Tuof4UTD2Dy7Mhq
 Q2OY67cIy4KBLuPaVfikjd9z9WXGJ2WjqtxZx0qUODY/XGN+2aW1R6r
X-Developer-Key: i=shumingf@realtek.com; a=ed25519;
 pk=ZM8Pg7tEJ0SDXQeBw6SfvcYyqXU9nF88DuTyxzf9utE=
X-Endpoint-Received: by B4 Relay for shumingf@realtek.com/20260924 with
 auth_id=1053
X-Original-From: Shuming Fan <shumingf@realtek.com>
Reply-To: shumingf@realtek.com

From: Shuming Fan <shumingf@realtek.com>

rt766/rt767 have wake capability. Add it to the wake_capable_list.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 drivers/soundwire/intel_auxdevice.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index a8407560bf4f..bcf94ea38cab 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -73,6 +73,8 @@ static struct wake_capable_part wake_capable_list[] = {
 	{0x025d, 0x717},
 	{0x025d, 0x721},
 	{0x025d, 0x722},
+	{0x025d, 0x766},
+	{0x025d, 0x767},
 	{0x04b3, 0x9356},
 };
 

-- 
2.55.0


