Received: from ach1ajh126.fra1.oracleemaildelivery.com (ach1ajh126.fra1.oracleemaildelivery.com [138.1.108.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD8B44C678
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.1.108.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057793; cv=none; b=nhqrCsJjH9gEf3h9LZisX5ky4ZsjdergyUSOyPP3yIkcJaAzVYKMWKv+RE17w6gX/Ak6t9DKpvJUGxF8T3ciDxXH5AUbf5zBUzp4tGfuSMgHDZsVOWS1QGgwcWfmAKkG5XhMqbyN24y12R/ccjxyRoSRqsmAQ+kvYnmjctknW1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057793; c=relaxed/simple;
	bh=LmveUmvvEIyEmVlZD3gZFKyDbkH7q7z/yPe4th6PCWY=;
	h=Message-id:Date:MIME-version:From:Subject:To:Cc:Content-type; b=V2msnzJhFDAuaJq7pXdjJbAyNKwqo4AfRtLb1FzYXRk8VwD32f0Dgq1KKgovfT+fcC4a1nwf2itcTkieG4wrICZioAYeay13fre8BoYzX27lWhY7e2TSKk3xEpKaveUqEN8VClSsB4NCdUgm9hoX0I4gygYqHxm+cnUdIuH7Cdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marmak.net.pl; spf=pass smtp.mailfrom=fra1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=marmak.net.pl header.i=@marmak.net.pl header.b=tL7NdL4K; dkim=pass (2048-bit key) header.d=fra1.rp.oracleemaildelivery.com header.i=@fra1.rp.oracleemaildelivery.com header.b=jGNIqFU8; arc=none smtp.client-ip=138.1.108.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marmak.net.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fra1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmak.net.pl header.i=@marmak.net.pl header.b="tL7NdL4K";
	dkim=pass (2048-bit key) header.d=fra1.rp.oracleemaildelivery.com header.i=@fra1.rp.oracleemaildelivery.com header.b="jGNIqFU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=marmak-2025;
 d=marmak.net.pl;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=xlHg7zzIGH4cgqXEayuWKHnY7aT40nkv/kfW7dTWU9k=;
 b=tL7NdL4KKVV0LAjbSZFSCDHFCVj+sVbkc8qqM8xxTxiyGuPlpOs29BR02lM8Tdwmt8vpJYBPOpuH
   /MlZ7UjAjWseb2UoY4r5ShEteAhRLFKETbuMgdk/f7sJb8ZFlqkgchkFWEiot+x7yunCj91tpGFG
   w0OWPVYyRcs2jU+6NCiY7LXPbmi4jdv4jXjM1A+nOkGwHifGXxl0oA18UVLrVro25qMtpZVIUrtw
   ou2nULMyY68XOWrARSl2yDx5HP7cIiZ1eLDJNwzYKLPO5kt6dXScFp6Ug400WeQKKlIFeH2ezm0m
   XDQnA/kUGmOi6zc4CrM+x6RfEBbEDYlcR2Ecyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-fra-20191115;
 d=fra1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=xlHg7zzIGH4cgqXEayuWKHnY7aT40nkv/kfW7dTWU9k=;
 b=jGNIqFU8S2Pwj0Gi/+4jNX4TWLOPD4Iaknv3RZpLi8bsUuSH6aj7pFddpm050fXfHgaNGt2slh/0
   3yWCE3+blVCK/aTD1obGLKi/Ej9woC9dFauQVc8ZYKTSOiyZWPmMQEe1sErSMIcb5URMN2pyUS2b
   oaBgsfhzGkrzp5GQenwS8U3OPFR4YhcqG93WdmatF3+PuLFusFxfE73vtveDRd5s6XTTk5T+Gwv3
   /jusk/8HHIbo9WlGU0JyO4ifkiddnqqMZGr0a+CphIkaPPqS31Eep3DSHeGoy0CotMzc7Vyw0/ng
   +H587usBlWzx4dNfGZS//KnKuDvfFwrxnU+XBQ==
Received: by omta-ad1-fd1-1402-eu-frankfurt-1.omtaad1.vcndpfra.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260617 64bit (built Jun 17
 2026))
 with ESMTPS id <0TI61UZGBJSRXVC0@omta-ad1-fd1-1402-eu-frankfurt-1.omtaad1.vcndpfra.oraclevcn.com>
 for linux-sound@vger.kernel.org; Tue, 14 Jul 2026 19:36:27 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-id: <4dab5622-9100-4730-8c99-b58da939549b@marmak.net.pl>
Date: Tue, 14 Jul 2026 21:36:26 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Marcel_K=C5=82os?= <marcel@marmak.net.pl>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP EliteBook 830 G8 (8AB8) to
 enable mute LEDs
Content-language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta:
 AAEZGPYiQxyy4woFyar989vYTYhwK/ZtIelICBF5wc4BWmbAgKKOejc+PGVKPcEp
 6wRHPAjBlMaUJNhVUtGbyYim65ZZuBD0HBfI1zaOFYjxbhTieUk27K0/Y/BzMd8L
 ka2Su47VeC49rqjaReLu17DvHeBHu2v8xUV3nUYPCZMuAIP5iD9Nsud+wLKVeCqu
 Byo1+RsTeqIj2k+vO50eg3KcH/n3I34C74fDk9jzLBNVYdcdtsQnad7/f2dKeWfH
 1Q7UrcHptzDOiSqevl/CNYgETeCCs3/Ld71vuUE1Qv4MsULZ5FoJg40y2DIzq4rA
 1yX7VqEKqpDZHsgnA5fH5SxFzlskqzpLnK3yKDzCfd7dRijm5yaX398DMAfAcNJI
 +6X1uKVFmx7lGAVVCOQJxfAtOt7E5JsohWRvqfjJ29+xefSuaTAk1DBTMfMEqz0y j+x2hGA=

The sound and microphone mute LEDs do not function on this newer
revision of the board (8AB8) while they do on the older 880D models.
I have verified this on another laptop which was manufactured before
the one with the issue.
Added the ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED from a G9 model, which
uses the same codec, to make it work. Tested on kernel version 7.1.3 on
the aforementioned newer revision notebook. 

Signed-off-by: Marcel Kłos <marcel@marmak.net.pl>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7700713d..18d3b17e5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7131,6 +7131,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa8, "HP EliteBook 640 G9 (MB 8AA6)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aab, "HP EliteBook 650 G9 (MB 8AA9)", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8ab8, "HP EliteBook 830 G8 Notebook PC (MB 8AB8)", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ab9, "HP EliteBook 840 G8 (MB 8AB8)", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8abb, "HP ZBook Firefly 14 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ad1, "HP EliteBook 840 14 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.55.0

