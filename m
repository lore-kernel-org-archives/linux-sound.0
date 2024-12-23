Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CF15383D
	for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 03:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734925459; cv=none; b=jdJsLMSPKt/es9c5cPB6IEivM8jivoBz6f/d29/IlcxVI3QYl8ldyJmbG1otwl9ZjLK4nfE4mUFikjmd7ooGKqfVijtuqybwOD/OarClq0xHudIISwj4IPq22bb2YVwh1xjJVn1uZEfhOofs5peCD1suN3WRNtMNXiJUNGyYESc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734925459; c=relaxed/simple;
	bh=wiCotrlSNcfOYMqCOwTTWVolUQ276Wzvq2WI0cpaXyw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rGAFqyCmfa7Q0ZUu/bRd40qGUUag0yx8yWjkNz/ITmntFqogJhkwhhVWENjDz0LirlvCTM678x/rtpbH1Jz44iPV60rwLF5lII8lnpDujBNT6y4XTAKVLYgrPCMtlrGOtlAnAa4BujdEdZjfheamnKIF+jPPm53fsDNa+A9ecqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=RWb4fKBe; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="RWb4fKBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1734925447; x=1735184647;
	bh=wiCotrlSNcfOYMqCOwTTWVolUQ276Wzvq2WI0cpaXyw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=RWb4fKBeUZhG7zezuF4psYrT6NqyiMRKlSO6U2Yo3vcu7h6DBa6KZpEmTb2mLiybq
	 bLADqx1njXgoh3YZ4kcIdPuHIIGy8BMaqhPg7uURh/79iK+izf5H9KaSE3RsOT0aol
	 3JI3JAmC73XbL5Ni9HOOKdzgUJA/S4rXd1AtH+2P3T6M8FqgoqvfwM3f41aj+MZzDC
	 uKgSGoukK/yw5pExn/ZVgNqa/riSuDHaxOVDkJa00uefF6SMtkrnHFKA/IEtqbPHls
	 r6ypAxDob8ZOiwuJa8zHLQVfXlpI8hd4KNxkKdwCApQP2IrCNyHJVdR9rsLjb0PNDi
	 I6D+2+JrHDmXQ==
Date: Mon, 23 Dec 2024 03:44:02 +0000
To: "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: [PATCH] ASoC: cs42l43: don't include '<linux/find.h>' directly
Message-ID: <t6y2aF0s2AtDT4mGv1iU8dxfUrRqRkiQL3ax3glwnfcpMZWTXxPvSdpnw2uQ5LjKQMNH6E8nNuLfmwAFzdS1Nllld4cW8Qxz5pO2XhNo984=@ethancedwards.com>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: 394b0dfe3163b07776d2d24f3336c82f170b4143
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The header in <linux/find.h> explicitly states that it should not be
included directly and instead use bitmap.h.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 4236f78beec0..bee032c3ebbe 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -12,7 +12,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/find.h>
+#include <linux/bitmap.h>
 #include <linux/gcd.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
--=20
2.47.1
