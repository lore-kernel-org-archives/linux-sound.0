Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018243AB498;
	Mon, 22 Jun 2026 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135788; cv=none; b=OWkm0DqUzQ2KrztjF1OenHESGkG4hWEwSHNiI1Oz1BUoJYNeYttVhgjswYAorBvo1uxB1clblohlv+hjOBczGZVK7HpSlQ/n7RXeJZR4KaSoXuk4o1K7HsmjyrtdkyUERcSIWbH1z/Iew3mCmzVsctMFVX0wutz1BRY3bC4IrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135788; c=relaxed/simple;
	bh=fqekt1IIwTAe9Vv6ULTX8Rq+XV28AsKJPKyvfLchC6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pn5cLwKNQgVQJG9ck6/dl4ABdTTEQLTa0Xsl+LmTsH8/+LcJPgYYouh8G+StVYaSoEEjgeIsbuv/9x9OkN9ywfFxh+dAjlCifrV2oeUUNe69kX9TnXBxH2xhH3JtV+jStw3pNBNBbape6ePu9osdzEHWaWlIylNrPgehP7gcY/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=EQXNNo6I; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="EQXNNo6I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=K2NAXBb8T8hw1MVXPoduQ99H+AoHr+kciJ2g7zRvyjk=; b=EQXNNo6IvFVUoH
	SwePJ+72V6MrWuO7Ug8j4hIFwPdq8+W8OOiaYbtyFoRaT6MQK3pUmnoyYy7Q1RCaO1jhkjQW/CgMI
	/bJpYIy2UmuXHDJy9FiG4si8mDOCWT5rIjsXtoHGftjq69n4gjfz2fq+yFYRzC1oSe+9wO+LjERuO
	SapKeSEcr/MMqbZkpvzWrXW0uDRqPghEaJ3/Fu+ZILPP0ptFEwF2XsMOQs9eDdZXpEVMNCRbH+kWO
	v/MdvamTvRn1d0cSNGkK72eCVNYWmz78RwMMXpe6L5LxGapscaj+fFckhpYf9agJ1bBLP1Eh5jmCu
	gyOcbCKBLIsfPYMDor9w==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbevJ-0051Om-9Y; Mon, 22 Jun 2026 14:42:49 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbevI-00000001x2x-31I7;
	Mon, 22 Jun 2026 14:42:48 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] ASoC: SDCA: fix __leXX types in find_sdca_control_range
Date: Mon, 22 Jun 2026 14:42:47 +0100
Message-Id: <20260622134247.465275-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The find_sdca_control_range passes u16 and u32 values to the
leXX_to_cpu() functions. Change this type and for the data
loop use the le32_to_cpup() to convert the value using a
pointer.

Fixes the following sparse warnings:
sound/soc/sdca/sdca_functions.c:868:23: warning: cast to restricted __le16
sound/soc/sdca/sdca_functions.c:869:23: warning: cast to restricted __le16
sound/soc/sdca/sdca_functions.c:877:34: warning: cast to restricted __le32

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/sdca/sdca_functions.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 77940bd6b33c..2e0b0ac4fa13 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -847,7 +847,7 @@ static int find_sdca_control_range(struct device *dev,
 {
 	u8 *range_list;
 	int num_range;
-	u16 *limits;
+	__le16 *limits;
 	int i;
 
 	num_range = fwnode_property_count_u8(control_node, "mipi-sdca-control-range");
@@ -863,7 +863,7 @@ static int find_sdca_control_range(struct device *dev,
 	fwnode_property_read_u8_array(control_node, "mipi-sdca-control-range",
 				      range_list, num_range);
 
-	limits = (u16 *)range_list;
+	limits = (__le16 *)range_list;
 
 	range->cols = le16_to_cpu(limits[0]);
 	range->rows = le16_to_cpu(limits[1]);
@@ -874,7 +874,7 @@ static int find_sdca_control_range(struct device *dev,
 		return -EINVAL;
 
 	for (i = 0; i < num_range; i++)
-		range->data[i] = le32_to_cpu(range->data[i]);
+		le32_to_cpup((__le32 *)&range->data[i]);
 
 	return 0;
 }
-- 
2.37.2.352.g3c44437643

