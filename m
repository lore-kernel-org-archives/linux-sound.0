Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050303B42D3;
	Mon, 10 Aug 2026 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355730; cv=none; b=L5MSHVdeRsoffPlViGZUhcTRHfunLBx8wSJ3omBBFcZEOV+fpDDsTl+VUQsh92687KXGCxHEIe/bi3WpRJvGaVdXdnJQgWHHYW7xhhY8KMdAELcGA9rfPVEmf6eaV4BmwTKMQlPH+qlTJW87qWoxg+40MUDn3VtZAHNzNCohI7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355730; c=relaxed/simple;
	bh=g4pi5XRM01FCZx/+SXMk92Ip1dXba1gn7czl7XC/rqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5CWG/2THDDiNKjNYGBiWElU7Z1CcjsZLLenxgAZHeC0Cj3UwLfr3ELSyw1/gFTRrCmBXsdWT5ha6Bt9EAnuDl0N/8aK7Q2jo0SdrexgZArG4ml0PHHY0RZeVlNgMmcCX8OSM8M0EMFwbh8SGXQNn4k6pxRTljv6lWG567SL1DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QML7M+op; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="QML7M+op"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=UlOX4Rj80R/mZ6aLndo3B0kFJwJHFgEObBv21SoBWqk=; b=
	QML7M+opxxm9777w0GK4nHaKTn/jJJQlXEcG1AKboBo/RxVXSlziLDIXwVr7w4QJ86ZRGWBSnx465
	kjKTlEA/jqD+BNzlfOhbkTZOx2kYVRCsC5wLZtpkwGO+hop0sgGdpuMr4PPZZck7AT6JOMDWI4zq7
	nNucBhwEGjF54v4u8XL7ZlKw8ZA53xSiHffjeBkrH1lRWztJemWisinq1d7bRv63SLdPef66o30IX
	UMX4e4WR/iaiYsV7MCoSxz8kObBPqfOCUO5kkqt9DhDpBUYit1+E09/uJ8opShxQ/8Po4LPPxztUY
	qydCqtiVHh0m7kwuJ536iib4S6WVXUhKog==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wtMih-00GWlB-8F; Mon, 10 Aug 2026 11:54:59 +0200
From: Luis Henriques <luis@igalia.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [PATCH] ASoC: SDCA: Add missing sdca_fdl_free_state definition
Date: Mon, 10 Aug 2026 10:55:12 +0100
Message-ID: <20260810095512.27087-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a build failure introduced by commit 0880082c27b6 ("ASoC:
SDCA: Remove devm from primary IRQ cleanup").  It simply adds function
sdca_fdl_free_state when SND_SOC_SDCA_FDL isn't defined.

Here's the build error:

../sound/soc/sdca/sdca_interrupts.c:471:56: error: 'sdca_fdl_free_state' undeclared (first use in this function); did you mean 'sdca_jack_free_state'?

Fixes: 0880082c27b6 ("ASoC: SDCA: Remove devm from primary IRQ cleanup")
Signed-off-by: Luis Henriques <luis@igalia.com>
---
 include/sound/sdca_fdl.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index dc33927b82bd..bc3600cdd2ec 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -83,6 +83,10 @@ static inline int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	return 0;
 }
 
+static inline void sdca_fdl_free_state(struct sdca_interrupt *interrupt)
+{
+}
+
 static inline int sdca_fdl_process(struct sdca_interrupt *interrupt)
 {
 	return 0;
