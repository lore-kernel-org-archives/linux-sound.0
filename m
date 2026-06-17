Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958813BCD19;
	Wed, 17 Jun 2026 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692199; cv=none; b=KVsEavqPS1i+Xcd9HaOEYT9TNlp9e9UDmQ72tFDvqtCmOYoZq0FHivp7gkg9uTy4oXHmSpqqmxiZVo2vYVkUqXxzOczQkcLPB7ycehmON9fH53ku9DwYuzGyJ2a0nj48F4hHi70s1VPDRBNPGiq5mlnJpAN/BEHH2eAIqYhrHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692199; c=relaxed/simple;
	bh=4w0sBRgJFRO1NPZG84jRa6LMe1+Jaxqkz6MNELks1Oc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=eYgyWzcKMlvWF+tt/b8gIs+yqwXDWi0ZVMO1fR4iwWmKVTUzaCnMkYbsKEtuX/U67+7NAxV0db2K45DAmkM+lfG7cJwypp4doXQ6KpIlSK1S2bJY5PDWzFCqp0yB9R3qLDW/jrPGOh+B9qz5UbQuMslHGmjmyyXFxTEqRswW2UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=sxxz7BwL; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="sxxz7BwL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:In-Reply-To:
	References; bh=u9s6yySfNqoBA97iW3i3dn3xcevfKkQ6ff5ZysUs2ao=; b=sxxz7BwLWDHr1A
	RsBMPDT0pyVPVUyuauERXR7vJIVwofNOjMwsfDs1CC/wyh3ny+7LF6FcCMPx66bDtwpRWh/znF8T/
	XByvsxkryt7AB/uvwXUz45CqGEKi/V78uCF2tGb9XgM3x5V/+9At3ZTaJHJA5hiqmb9WPYxUxgKlG
	qMcKGSBXBGTgH03yhPYTNZ+Sz/NKEfnUuLIv14c9xZeAOHPfWyBlTZXjh9rb3LUfNkWM+k/uEmGQb
	VXr26pZ1h3kYMIeH7jcODT9qMkDaHI+DJrHbJhQ+uiIEXyNMwo54Un4EamfPycREUlEWkTZH5R0sk
	ZHdpbaXVuLjs/e1oOQEw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wZnWj-00Cya0-0K; Wed, 17 Jun 2026 11:29:45 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wZnWi-00000003kYl-3GCW;
	Wed, 17 Jun 2026 11:29:44 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: pcm: fix __le32 cast warning in snd_pcm_set_sync_per_card
Date: Wed, 17 Jun 2026 11:29:43 +0100
Message-Id: <20260617102943.893950-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

In snd_pcm_set_sync_per_card() the le32 value is written to an u32
instead of an __le32 pointer. Fix the following warning by fixing
the type:

sound/soc/soc-pcm.c:2166:9: warning: incorrect type in argument 7 (different base types)
sound/soc/soc-pcm.c:2166:9:    expected int
sound/soc/soc-pcm.c:2166:9:    got restricted snd_pcm_format_t

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/core/pcm_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index fe597f7d522d..4d665b4148d7 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -545,7 +545,7 @@ void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       const unsigned char *id, unsigned int len)
 {
-	*(__u32 *)params->sync = cpu_to_le32(substream->pcm->card->number);
+	*(__le32 *)params->sync = cpu_to_le32(substream->pcm->card->number);
 	len = min(12, len);
 	memcpy(params->sync + 4, id, len);
 	memset(params->sync + 4 + len, 0, 12 - len);
-- 
2.37.2.352.g3c44437643

