Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8961FDE31
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 23:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=136.143.169.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768260059; cv=fail; b=kSmKmEJUz7SgRW9e4IzsCaG0VnLyTgUg3KmXMzTAEHYw4BB7h2X3rXQrCmPIjTXb+P0SFiuRCIeRNatlJ4tvTyMSpxe1FX2ndMJGghqvOqyYDQCYlw8hknqXht0iIaXhNXLxQIusbeDaQpnRx/Vzv8gybpTlCKOuUyjcxIJA6dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768260059; c=relaxed/simple;
	bh=gUCl8rJgi5JZZUajDSeEje2inVX+NbOYueTDg7Ukjaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMD7EyQc/4gVF2v10ECLXTVeRP8371nG85krTjG8q8OvKLZioD6kU2P4M4iNCEAV+TIV/a/eTUEuwydiCU926S3xq+NtpL25UD5eBWJFBjewsV8PB3P29T1XzoYIVu8syrxCBE7ri/4FGgRYG0zFlUhBBLc00yguJXE+D5D4/T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=RRLs7wC3; arc=fail smtp.client-ip=136.143.169.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="RRLs7wC3"
ARC-Seal: i=1; a=rsa-sha256; t=1768260028; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=RJHiHvMT2jdt5hfSrzAqXeCuGCzgByON/1QrkNhYN8tSFE4RROtBdr1Zk7dxnQh/ZkVTrln+HmD9rU3cYgYqEPZfdHw/DF0JYZ3NmW4ye/wnLZrdL0acdAgPbLeFbTTbJuS+MD6To4l2zvTGbe4lGayOZeup/VDlDTBcpfn2/aw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1768260028; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:Message-Id:Reply-To:To; 
	bh=t8YVTUNDPbiGlyRP9Kvs+TKskbRinStYzkp4l9CgP4c=; 
	b=GkRrXv+dtfesqZBdlrfrerAIZ8fH4eTkoO5zTVjjXtiPHw4REJQ+EsN8wM7hJnRpkAP98SecfTCO23QGc15PiYHQSIg46KGNgIVEgqtFVUlwzwZm49b85GHMLKxJCDSU2fBL3AEg33jQWa+V4+4t+74exH6IrEQr7h9dzH7u9Rw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768260028;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=t8YVTUNDPbiGlyRP9Kvs+TKskbRinStYzkp4l9CgP4c=;
	b=RRLs7wC32CNBGbuwdjGrPTOC8UizSCjJhqkfe2MzUd2LD9WQ4e0bQ2trMPU97GZE
	9JMD/A3IaM5QXIo86ZdUyEazYIU4KRZLjLwvJclu/bM4U1vGMwR/EHEnREnCdTBa/yc
	aon0TJfsVf3cspjeyBze1MQQxUdgpMVvjRoyps6U=
Received: by mx.zoho.eu with SMTPS id 1768260028167168.20392177406688;
	Tue, 13 Jan 2026 00:20:28 +0100 (CET)
From: Fabio Forni <development@redaril.me>
To: 
Cc: Fabio Forni <development@redaril.me>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 2/3] ASoC: simple-card: Replace "parse error" with a more descriptive msg
Date: Tue, 13 Jan 2026 00:12:23 +0100
Message-ID: <20260112231855.193030-3-development@redaril.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112231855.193030-1-development@redaril.me>
References: <20260112231855.193030-1-development@redaril.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"parse error" is misleading: it made me think the device tree contains
syntax errors, or phandles of the wrong type were passed to the
simple-audio-card node. Instead in my case, the `sound-dai` subnode of
`simple-audio-card,cpu` was referring to an uninitialized device, because
its kernel module wasn't loaded yet.

As far as I understood, simple_probe fails when components composing
the sound card are missing or simply not ready.

Signed-off-by: Fabio Forni <development@redaril.me>
---
 sound/soc/generic/simple-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 8d36cbbfca1d..298f8cc98130 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -806,7 +806,7 @@ static int simple_probe(struct platform_device *pdev)
 err:
 	simple_util_clean_reference(card);
 end:
-	return dev_err_probe(dev, ret, "parse error\n");
+	return dev_err_probe(dev, ret, "components missing or uninitialized\n");
 }
 
 static const struct of_device_id simple_of_match[] = {
-- 
2.52.0

