Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69D426A1BB
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 17:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400227; cv=none; b=D94PHLuY4MeytyUL+Ybl4sT+745xFJMF2MNOYx2OGwuO2f1N3mQ3vPlV0XY7pZC4eBO+D784j7UZdgS1EMuv4wPOYEogrlc2WeB2wzVvE40Ag3VjxcEwjpqqcOTR80lF+7GvQEXVG1JeKHiBBldXUdr5Q1GMI3GSXZnKivG9j0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400227; c=relaxed/simple;
	bh=rZMI5ddC03/HntA2UJSpcweveHReKlgu7+nTTTOMvKU=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=rIpr440XV15XWBjvbYl8PrSzcZJEIbzIci6YWNsxDaDKahdM6ayJwRa00JzbpTgnThDlg+UNFSA/y9GGas00g5PhiMCu0dgcU52Z1ME7liQ2rx63B8meK3qgotcPZPEfuvK6bbJbACvPa7uR6QVTi1ccPoCyKHQ0vU/cFVelbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=OALoNd3W; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="OALoNd3W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=WiH/J2EkG7b6KeOZqcsKppkU+1VRiawpGikENiWlKJU=; b=O
	ALoNd3WwT6GHZ4Yt584PQRIeNsjwem6eSUpG+VCyLzZtMDfKfMiEudBXWvADfQLymAOqTDjRCVEzT
	IpJ4TjGbrXGYW4n7D+CwPtDSlYD0fKJ+JdTBS6TcNLpnDB3z00aNTgm8kDz3wedhxQPh9OCBeJ6KH
	YEu96fLc5zdwVXiavFwg+MThj/8C5OKIaQEvx2FTlgsQFxYKEz3e4lo3KFxdhMz5De7JafQXHQLWG
	Ip+U2c6HA7PtY4TFUWo0IlbpDJtkjHxzOdce1DbBjakYlrPkUz3k8TkLJh16FZK1kXRnziQPj0lDj
	QkPKe/h8tjzofpwsQVmKtueqXPwc6WGmQ==;
Date: Mon, 17 Nov 2025 18:23:51 +0100 (CET)
Message-Id: <20251117.182351.1595411649664739497.rene@exactco.de>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org, perex@perex.cz, rf@opensource.cirrus.com
Subject: [PATCH V2] ALSA: hda/cirrus fix cs420x MacPro 6,1 inverted jack
 detection
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Turns out the Apple MacPro 6,1 trashcan also needs the inverted jack
detection like Mac mini patched, too.

Signed-off-by: René Rebe <rene@exactco.de> 

---
v2: sorted by pciid

--- a/sound/hda/codecs/cirrus/cs420x.c
+++ b/sound/hda/codecs/cirrus/cs420x.c
@@ -585,6 +585,7 @@ static const struct hda_quirk cs4208_mac_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x106b, 0x6c00, "MacMini 7,1", CS4208_MACMINI),
 	SND_PCI_QUIRK(0x106b, 0x7100, "MacBookAir 6,1", CS4208_MBA6),
 	SND_PCI_QUIRK(0x106b, 0x7200, "MacBookAir 6,2", CS4208_MBA6),
+	SND_PCI_QUIRK(0x106b, 0x7800, "MacPro 6,1", CS4208_MACMINI),
 	SND_PCI_QUIRK(0x106b, 0x7b00, "MacBookPro 12,1", CS4208_MBP11),
 	{} /* terminator */
 };

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de
