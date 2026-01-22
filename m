Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B20378825;
	Thu, 22 Jan 2026 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102305; cv=none; b=bZMdtuc3ZyAFKYx7on4KuT8cWWoYLjEGTDPwN0GGzYTVE+fd1aN7fn9VWt6/SfQDaTc+ZrQNmA7kKgIXqJUWvo8jFdPebDME24VlKehNtx2TK7g7tBC9vt2pgEToerRaNGDE8DoAluIEaNIIZL+99NNjNdHQfW1kbaXlKaP8F4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102305; c=relaxed/simple;
	bh=mINIPcwkZ3+ihnbByF+c7H8LCrYRvaUjvikJxPU5qz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhEx7JNJ6LoHeiUE2UXpwnDUelxV5giAnelol1OMmVrN0N/YgM6CTQPKGvTVY5IlvwpvOtOmEmIqTZ+womx9b1T2uZstUNpA0cSI3ibvktGkUkFaNCudxJbP9R+rJ8dJRw3GW1Q/LtoL+7ugajdI3G+q0ojs3uc9tUJHX+yoJCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=VOIsXkv0; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="VOIsXkv0"
Received: from wse-pc.. (unknown [61.8.159.47])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id ABD6F2FC0052;
	Thu, 22 Jan 2026 18:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1769102287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MbUswkyYSS5zIyzO+gRnwoGK2Jti/4lYb0JMcjMZ0O8=;
	b=VOIsXkv0jabKcwJvyQtiBdUSTeGatpQSkP/pVqzHBnz/H6wQTCzLRLwl20GRyCo7akwR19
	6jkcKTUNjtuUyh395odVHRqvMjxAH4EASIdRQ4btRjUnebURKUycjBu9mW+nmbRjb6FQxQ
	f2r37qt+Z9sbphKyRecgD7NJI/R1J/E=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: hda/realtek: Fix headset mic for TongFang  X6AR55xU
Date: Thu, 22 Jan 2026 18:13:42 +0100
Message-ID: <20260122171543.19958-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry the last patch I sent didn't actually work. Here is a revert and
a new version. Luckily it was catched quickly.

Tim Guttzeit (1):
  ALSA: hda/realtek: Really fix headset mic for TongFang  X6AR55xU

Werner Sembach (1):
  Revert "ALSA: hda/realtek: Fix headset mic for TongFang  X6AR55xU"

 sound/hda/codecs/realtek/alc269.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.43.0

