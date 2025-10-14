Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E778C236454
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 03:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760411161; cv=none; b=K3Gt9SG8Nim1Mj2gzpQweboKWqceTVXd2uB/jks+YWaMxAlcoc7DYNTF3irAsIENxmtPK/A3vhJTKCIFjQvC9mH8+FAcBmjXhnOMzumloZo1wZssJdehUbADNUc1gqdA/nYV3WmjI920RBTGDCaPBmPcfmQXVpHPa3ctVO1hYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760411161; c=relaxed/simple;
	bh=2CPyrkp+apvtuQA3Sa8jY+2yiXeXf+BJV5vKJZZUmH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LcTdaQ+DQDreWKypNlynq8tljgjW+olb2fqCUittzuWn1KV2oeaAY9zOFtFAQjnhNzVmFCdTgZJndEbCHIdmpcavEPFZ8xhUbI9BcoQ2MNrXG133Y2JQG/ICXwbKVOnfhsFSecOW3ySApTgIKmd9lOPONBCEAB3Tqqa5d3Z9dBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ii6YRybv; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ii6YRybv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PeHzqyE5OuV4el6F3bhioETdrtGAKzjtDBx05Hb2oDc=; b=Ii6YRybvoyFgU5MWMLXze9kAZ8
	xNzWX0LO+0KVk9AI4TiibLYVwCuR4cKoshSpXR3iwmhDebYYVQzQbMG56dnAg0mxcUF5eStVKmb7P
	ZkGk7KCZpZ60bF8O0DwaOhFaDxZd2FJptydPmcKr2zDJ6mMhgUn+03zPzibSF+2wU+8t+uQFbUrsm
	RUOxw4dUAWJrfGg5HwrYFLEtCtVcnnJouvmr/P5sjuILW9pL5gONSNeToHvbT/vemGIZJPBXwNaTt
	176Q2QV6kvq1Y6rpsATJnVOLGrYxO7tiCUPsROXe2415tvdi0HlrgCBLN2Zn0PazMKpBSo8QfAs6m
	T6owajJg==;
Received: from [50.53.43.113] (helo=smtpauth.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VMK-00000004sLy-1gaV;
	Tue, 14 Oct 2025 03:05:57 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] sound: amdtp-stream: fix enum kernel-doc warnings
Date: Mon, 13 Oct 2025 20:05:52 -0700
Message-ID: <20251014030552.760648-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling of CIP_NO_HEADER to prevent a kernel-doc warning.

Warning: amdtp-stream.h:57 Enum value 'CIP_NO_HEADER' not described in enum 'cip_flags'
Warning: amdtp-stream.h:57 Excess enum value '%CIP_NO_HEADERS' description in 'cip_flags'

Fixes: 3b196c394dd9f ("ALSA: firewire-lib: add no-header packet processing")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Clemens Ladisch <clemens@ladisch.de>
Cc: Jaroslav Kysela <perex@perex.cz>
---
 sound/firewire/amdtp-stream.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251013.orig/sound/firewire/amdtp-stream.h
+++ linux-next-20251013/sound/firewire/amdtp-stream.h
@@ -32,7 +32,7 @@
  *	allows 5 times as large as IEC 61883-6 defines.
  * @CIP_HEADER_WITHOUT_EOH: Only for in-stream. CIP Header doesn't include
  *	valid EOH.
- * @CIP_NO_HEADERS: a lack of headers in packets
+ * @CIP_NO_HEADER: a lack of headers in packets
  * @CIP_UNALIGHED_DBC: Only for in-stream. The value of dbc is not alighed to
  *	the value of current SYT_INTERVAL; e.g. initial value is not zero.
  * @CIP_UNAWARE_SYT: For outgoing packet, the value in SYT field of CIP is 0xffff.
