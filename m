Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A751C2339
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388904; cv=none; b=QzxeGYUj3x+Qx2QKPHqhqRujRKdMhv6SpbnChDDvntN06U6laiZlMHcx3eDIuae3+ACaxeHQESpQDSgfG8wlyeASs6fVaPr1yZqK3Sqbz9nbzPUX2lfdgJXdWKgj7YNl7FMb5VfkXk6Rlv8RZ5CA/Oev1wXkXw3xuglrRF6FPZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388904; c=relaxed/simple;
	bh=HSaIa5IMw2L9bnZMzP7MDoTaXyPkpvegFi1c1KB6+ms=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Z7RlKAKRzFGJx1ldgGBFgNiVRSnhgQKGvFmwY/fisi2AuC9q/tC5ID/ozSbL+yyAta/B+mdT3OIdIxLXTQo1Z5XDwIPRH6nwJUCk3XIi8SqPTwLcJsmFI6noshik/vcAv7JHKA1H8D9YytKXSKI+03ceaLSlzp5fwYOCV4Ujfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IKYuu6bM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XYxdGObL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IKYuu6bM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XYxdGObL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IKYuu6bM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XYxdGObL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IKYuu6bM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XYxdGObL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3645E2128F;
	Tue,  8 Oct 2024 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728388900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8hqT0rMyFqmwlm5iedaUQEDVFWgEPEkqJYnS7dcIKa4=;
	b=IKYuu6bMjcZHvaxAwH0waiQckLVQxUtmf8iKLqsznZbvA/4X5/+YX0OaS8Hn7ydMvNQke+
	Vecb5fY4IomK29k66pf6zmyVIWcQN1rSFROJCl7CTp4KI/dCnODuyv60N5CFrY0b0aPZ8R
	+V9ZFczVJdQUD2X0KKUSsSq9+U9XQXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728388900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8hqT0rMyFqmwlm5iedaUQEDVFWgEPEkqJYnS7dcIKa4=;
	b=XYxdGObLsArT+89v9CS8I1YUVluP+QBWeYyuzUqDxEc3K6XsCiemFp0WSMbzKXkG8I24YS
	hj8xudSP+yJWPRAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728388900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8hqT0rMyFqmwlm5iedaUQEDVFWgEPEkqJYnS7dcIKa4=;
	b=IKYuu6bMjcZHvaxAwH0waiQckLVQxUtmf8iKLqsznZbvA/4X5/+YX0OaS8Hn7ydMvNQke+
	Vecb5fY4IomK29k66pf6zmyVIWcQN1rSFROJCl7CTp4KI/dCnODuyv60N5CFrY0b0aPZ8R
	+V9ZFczVJdQUD2X0KKUSsSq9+U9XQXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728388900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8hqT0rMyFqmwlm5iedaUQEDVFWgEPEkqJYnS7dcIKa4=;
	b=XYxdGObLsArT+89v9CS8I1YUVluP+QBWeYyuzUqDxEc3K6XsCiemFp0WSMbzKXkG8I24YS
	hj8xudSP+yJWPRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 278761340C;
	Tue,  8 Oct 2024 12:01:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WOoKCSQfBWdObAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Oct 2024 12:01:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/3] ALSA: allow quirks with codec SSID matching
Date: Tue,  8 Oct 2024 14:02:28 +0200
Message-ID: <20241008120233.7154-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.980];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Hi,

this is a cleanup patch for HD-audio to allow the quirk entries
with the primary codec SSID matching instead of PCI SSID.
It helps for reducing the conditional application of quirks for
devices with the conflicting PCI SSIDs.


Takashi

===

Takashi Iwai (3):
  ALSA: hda: Use own quirk lookup helper
  ALSA: hda/conexant: Use the new codec SSID matching
  ALSA: hda/realtek: Use codec SSID matching for Lenovo devices

 sound/pci/hda/hda_auto_parser.c     |  61 +++++++++++---
 sound/pci/hda/hda_local.h           |  22 +++++-
 sound/pci/hda/patch_analog.c        |   6 +-
 sound/pci/hda/patch_cirrus.c        |   8 +-
 sound/pci/hda/patch_conexant.c      |  36 +++------
 sound/pci/hda/patch_cs8409-tables.c |   2 +-
 sound/pci/hda/patch_cs8409.h        |   2 +-
 sound/pci/hda/patch_realtek.c       | 118 +++++-----------------------
 sound/pci/hda/patch_sigmatel.c      |  22 +++---
 sound/pci/hda/patch_via.c           |   2 +-
 10 files changed, 121 insertions(+), 158 deletions(-)

-- 
2.43.0

