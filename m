Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD2E357A4C;
	Fri,  9 Jan 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949467; cv=none; b=TYpgVQBsAQtst4eHAMvpXJvu9jhFyp9w1H+B63E5fL3XHD6N49QOpv282GQpcUeum/k+kzb05BylFchxtuwmMd5pM4vvLLFUbORF6pqMUj0OK//L56r0JOlRq8YrTc8AJjTeqdo65xOplS1SdhkH5jyUESvL+K98f1TEV3v3llM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949467; c=relaxed/simple;
	bh=Bn5X2vdRF2WnlJCk1id3vXSW3OfBZe3EjDM5m3vmlzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jI/O4kO2ed+RHw545UtL0AobNlLlAGu+DRJnFjbukGGQI/tSWZoseOuzK5S7EnyN9rwB8SXbuCVCa+xSKMsQ9iGAup+e5vEMRNK6TYp+iroa6AK2qtGDcCWJ5LuTQkgnGzwjJHAkVn3gsmMk59C0lYw5wHZ1m3E90qDlZMyhQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=24lV4PBC; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="24lV4PBC"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1767949457;
	bh=PMawZLCXDjs5OqPIY8yGDtmIflK1E6VmjuRtvjlXdY8=; l=618;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=24lV4PBC6LNc1CvqbVfbvEeBygPPCkRIEeYMlMTy4vqvXmiAWqh8D6HGPnOLwmsq4
	 Tsnc5Twgs+tf+gaEJZRRyKoZx5CQdyjoN4AfGwElw6z6c8+1dlrTo4i+NSjM/bluj2
	 CPGtjzve7ZsBIXbgdSOZiRMlBCFjGKLXNr1xACooWjAFqYZ119m42tIMKPmLIjNGVs
	 iMeewLXy2nTY1cSUKs6jyWC9Ry5r+JNyv/mIOTIKzDuKkFolfx2HEfpgKRjZ4MBKqp
	 k8KlbstBMA6ZxzsnCL7UWY770C2bUhv1buwHotugpped1yZz4IswY4QoODurDP/LYk
	 FRm/W4WPDjYTA==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572468:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 09 Jan 2026 17:03:59 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 9 Jan
 2026 17:03:59 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Fri, 9 Jan 2026 17:03:59 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>, <musk_wang@richtek.com>,
	<roy_chiu@richtek.com>, <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 0/3] ASoC: Update rtq9128 document and source file
Date: Fri, 9 Jan 2026 17:03:51 +0800
Message-ID: <cover.1767948925.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series include two parts
- Update initial setting for rtq9128 specific feature
- Add rtq9154 backward compatible with rtq9128

ChiYuan Huang (3):
  ASoC: codecs: rtq9128: Modify the chip initial setting
  dt-bindings: sound: rtq9128: Add rtq9154 backward compatible
  ASoC: codecs: rtq9128: Add compatible changes for rtq9154

 .../bindings/sound/richtek,rtq9128.yaml       |  12 +-
 sound/soc/codecs/rtq9128.c                    | 114 ++++++++++++++++--
 2 files changed, 117 insertions(+), 9 deletions(-)


base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
-- 
2.34.1

