Received: from resdmta-c2p-547356.sys.comcast.net (resdmta-c2p-547356.sys.comcast.net [96.102.19.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB138F82
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.102.19.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783685; cv=none; b=XO+Dng4OGVRv7HmAUsufShuei1jZY/7vbFe3oynxt3ovdOzSGWz6MQS2YARw26pIqaSaZTTBUyO0vUrJqs0i/0y4i6zumh/ltejACPh4jzoj6MgD4sbYGYUgPHVpTMV7Sr8EmDKJlK1yGAJxiEPVuXJWIlEKftfAq2TtpvOaFEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783685; c=relaxed/simple;
	bh=mTQBQFWZ1jf/LqBzBp1vO9PVWlMHdy7iJ8PNac1dtto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ujt1hquirjU0g0Hkz5kBkHtObAIYAOxsZKFcBSrSjbjYQjuo19dFnjOFcNj1280j4CfZNDd6cbWuFY6RxqvggeIAut6xzjnzTNMo7ypwL639ysVdxiKQ7/j8tVN0X1FxWTImxiEYeYv9EtQUNDGjxVnqezwsoSuYP7mcf64qrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=comcast.net; spf=pass smtp.mailfrom=comcast.net; dkim=pass (2048-bit key) header.d=comcast.net header.i=@comcast.net header.b=YrYxZLSE; arc=none smtp.client-ip=96.102.19.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=comcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=comcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=comcast.net header.i=@comcast.net header.b="YrYxZLSE"
Received: from resomta-c2p-555661.sys.comcast.net ([96.102.18.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by resdmta-c2p-547356.sys.comcast.net with ESMTPS
	id ffdmtdZrXU6XqfkzXtmJvF; Wed, 05 Feb 2025 19:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=20190202a; t=1738783399;
	bh=cPWjrl211jrRRsO8j1icidvMt4y4mFK6qPjUJrYoABQ=;
	h=Received:Received:From:To:Subject:Date:Message-ID:MIME-Version:
	 Xfinity-Spam-Result;
	b=YrYxZLSE15E+V3gWLVUmMCY3OH6cYOcYWkXmKQ6pzGmzmY7YLWDNFrrPu/tK/M/PQ
	 JQUeY3sSa7Hw7HfJQ922SELLWJMsvzhgxvgjlNhqKOxRx1fFS7LVCaQ+h5AGw5DXOn
	 KLD6w+R9R0wG97q+eBz1jkFyoBdHKZLEEJmcQPObLVPwpeg+snLYkvZOhv3Xq4MJX9
	 6vnkSY0BTzndIGokDKyhU+hjlG75v2ZBAUvkWLc6y6EbzY2+n0ZWuAFF+67um7euyb
	 PQf24vWgK3BNoFekgHzzycA690KDY/7Q0ZD5IWiVosCY6s9XAs9UFIRfhXxkTTTUNq
	 F7//8azpQGxLg==
Received: from jack-livingood.hsd1.ca.comcast.net
 ([IPv6:2601:647:4d81:b870::c894])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by resomta-c2p-555661.sys.comcast.net with ESMTPSA
	id fkzNt0p970c8kfkzUtu6qk; Wed, 05 Feb 2025 19:23:18 +0000
From: jack Livingood <jacklivingood@comcast.net>
To: clemens@ladisch.de
Cc: o-takashi@sakamocchi.jp,
	linux-sound@vger.kernel.org,
	Jack Livingood <jacklivingood@comcast.net>
Subject: [PATCH 1/2] sounds: firewire: isight: changed strcpy to strscpy
Date: Wed,  5 Feb 2025 11:22:58 -0800
Message-ID: <20250205192258.358362-1-jacklivingood@comcast.net>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOTOo8MVHWN1W8vTs4xvJSjkeLDgOVoGpgC+A9/h1awUgK2zjjAmgVXlW2Wrhp8y85lThJEdCHHD2Ys2lqaeeeCqiyc9Bcg+CFipOjLllcoZ/xBnhCpz
 X0NxrFQ5XEL0yRgvwuSH6DvbTrowF9I4vPVKLCtqG0ewRTLLDOQjR7XEyM+5WX900h7Xi8GyExF0UOpGwksN4Gz4F7bYvd6qEr1JehwH9YpepAn4fYr5h5s/
 vcsyiaRbqrM7OTBMpVSvAkr0MGDRBB2Z3CHSAIu5MmPeN2hbJrsa6xQ68z+NqjvmmdrooaEf7PRhnPdxjckZZxBoQ+cY5m39cwvpVmoRj8rUDkC10KcJUTJs
 WPXI3coQZ6TwrvB03h+DPHi2biQGIw==

From: Jack Livingood <jacklivingood@comcast.net>

changed strcpy to strscpy in order to prevent a possible linear
overflow.

Signed-off-by: Jack Livingood <jacklivingood@comcast.net>
---
 sound/firewire/isight.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index 806f82c9ceee..e9617fc0a532 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -637,13 +637,13 @@ static int isight_probe(struct fw_unit *unit,
 
 	card->private_free = isight_card_free;
 
-	strcpy(card->driver, "iSight");
-	strcpy(card->shortname, "Apple iSight");
+	strscpy(card->driver, "iSight");
+	strscpy(card->shortname, "Apple iSight");
 	snprintf(card->longname, sizeof(card->longname),
 		 "Apple iSight (GUID %08x%08x) at %s, S%d",
 		 fw_dev->config_rom[3], fw_dev->config_rom[4],
 		 dev_name(&unit->device), 100 << fw_dev->max_speed);
-	strcpy(card->mixername, "iSight");
+	strspy(card->mixername, "iSight");
 
 	err = isight_create_pcm(isight);
 	if (err < 0)
-- 
2.48.1

