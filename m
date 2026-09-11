Received: from smtp153-140.sina.com.cn (smtp153-140.sina.com.cn [61.135.153.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3D846A608
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133341; cv=none; b=Q7qJQANGG2BZFQzcjpAfvBRAO63RtKSVjAsXC+jeOQYjhlqSfN3mTe2yrogaKNrsOwcysApSmvr0HnNLR9u67uRUIfeW6aZVLaVRTzMcfXmEe87f3HW5szVgVVlH2WyhjFVlD0fO26XPPJZ5J834axAcs8GxfRQVRupwOBohK/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133341; c=relaxed/simple;
	bh=bwmIujNayDw1nZ8g6aV3jZ4uLNrmHhStcjdMqNl85EM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=jTHU/QIFyY7FfvdUBY4YbOZ40MNJA+Con7xGOxUplBVNOf0yrbV7tXe8lVKUH+hn/9lvABNU5nkxDXLU1vsfI06D5BwbBg/VHXigp6qokPZLQMlMB09PNkd7I4KIyH61in+pZjRSfRsF5ZQ9qBy3s7STkOIgDKu3811IC7DBS68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6AA401EC00006365; Fri, 11 Sep 2026 21:28:13 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D7F0BA675F3B457EACC30D4D73CE9A32
X-SMAIL-UIID: D7F0BA675F3B457EACC30D4D73CE9A32-20260911-212813
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v3 0/2] ASoC: codecs: ES8326: Modify the configuration and add kcontrol
Date: Fri, 11 Sep 2026 21:28:07 +0800
Message-Id: <20260911132809.4478-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the standby configuration and add the kcontrol related to HPF

Changes in v3:
	- Modify the incorrect version number

Changes in v2:
	- Modify the parameters of 'find_best_hpf_freq'
	- Modify debug information in kcontrol
	- Fix the issue with the incorrect removal of the jack report

Zhang Yi (2):
  ASoC: codecs: ES8326: Add private members about HPF
  ASoC: codecs: ES8326: Adjust the standby configuration

 sound/soc/codecs/es8326.c | 145 +++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/es8326.h |   4 ++
 2 files changed, 139 insertions(+), 10 deletions(-)

-- 
2.17.1

