Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3AB348865;
	Thu, 20 Nov 2025 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648269; cv=none; b=Oau9sQAT8ZnYuApr7rWo3GHy5mnmVw4Un9YmmIRyYrp6GV6HU6EBHakYTsIs5W/450XB8DqLV9xpHvcbMCpTJ0U4r4gW1KDjx8hMFIENL9mEACa0tGGc0UpGujWxVqWc2hHWhrZcu6jauzC81LiL+VSYlKQqTN/IAfP9kYHIO8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648269; c=relaxed/simple;
	bh=y6evLwpONo0Q6hgtBevOxUcvw2rrcIFegFUpcS3BIuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=quHMB2VOc+QDaIwQhsvsKPslM6C55wgxZpXJR7NBe3inQo0LuQB9YDCsTcvL8+Eo0dI/M+XflwymZjl+RwohEt9w0jSVScP7ua3/8zvOF790Z1XwI9xWlUDvAvPtUoxY1nGjaglWTqydHH6hW3jMzB4xePSN8+VvpnhNWYgPUc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OtY+MnZ2; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OtY+MnZ2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BzOeqDLfHvta94h1Z5RMOqABlFt21zBhpliRxNuWQMk=; b=OtY+MnZ2tdpwyH1wyaqR67SuNE
	GkejtAcKuhHmxq6YnWi5zQdLPnocyW4MTLc4iSCUtDcVldXtFWffzO/Yk7TGqAnKtb4O2pli8fmWe
	38dxcyiOdhUnWRFKTxHpoAGUQa6iF0e2rMxNF+dtLbRsSCiF/d8foo5C7v920Sq4TWnB//Qedl335
	1M+O4+ioO2HTHqLTC4zAO06EAvm99u3NrfuFZJFibOF8D8fFCCgadWSuSDqPOthSOmQBWTzbhYDTN
	Qq0sYx1fJWGJqT9O3UenEH05WQHnA/fHKMBjY06hjBVcCzFwtJFWi5LLWpn3PKbuFGIgjsEOFrwUS
	4Jonr7eg==;
Received: from [49.36.127.56] (helo=uajain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vM5Tb-003GX4-P2; Thu, 20 Nov 2025 15:17:35 +0100
From: Umang Jain <uajain@igalia.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Umang Jain <uajain@igalia.com>
Subject: [PATCH] ALSA: pcm: Harden the spk_alloc assumption check
Date: Thu, 20 Nov 2025 19:47:57 +0530
Message-ID: <20251120141757.901505-1-uajain@igalia.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the parsed ELD has spk_alloc=0, it currently assigns the parsed ELD
spk_alloc to 0xffff. However, we should also check if there is at least
one SAD (Short audio descriptor) to enforce the assumption, as ELD
without any sad_count, is usually considered invalid for e.g. in
commit ce9778b7a0272("ALSA: hda/hdmi: Consider ELD is invalid when no
SAD is present").

Signed-off-by: Umang Jain <uajain@igalia.com>
---
 sound/core/pcm_drm_eld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
index 688eefce82fa..cb2eebaac85f 100644
--- a/sound/core/pcm_drm_eld.c
+++ b/sound/core/pcm_drm_eld.c
@@ -379,7 +379,7 @@ int snd_parse_eld(struct device *dev, struct snd_parsed_hdmi_eld *e,
 	 * in console or for audio devices. Assume the highest speakers
 	 * configuration, to _not_ prohibit multi-channel audio playback.
 	 */
-	if (!e->spk_alloc)
+	if (!e->spk_alloc && e->sad_count)
 		e->spk_alloc = 0xffff;
 
 	return 0;
-- 
2.51.2

