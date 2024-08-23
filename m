Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD559748A;
	Fri, 23 Aug 2024 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399183; cv=none; b=sG8b0lP+dIbR/vy2N7omMg3pyb+jWtHgyixe4xIXhT/ZXfetKyer8o0rORDBNc0LPwjjm4yS8N0IgFo8obJra2UrLR4tlzQRUc0dIXj6aJEnneqXk7U92xUNTEHZVY6EuHmhF4hCj2TqwL9vMNjEqKAk5I4sfFz1jojhN/Ha9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399183; c=relaxed/simple;
	bh=5nyKyZ5l3oYQyopuRxLzLGXUF+zt0bA2UFBs5Qu4qU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=FDJPdiz6RpxINyBKA8s7tPoujA4vW0gEqG/aXSrgnURbvnee+jzSUvx5dtkrQKKUOnTHX/ehfvDOPV1uNEeElizUO7Ap1LsJwfSkm3B+88q09HvjEX8KO1DlOPnfPzp7h9q6SWQhJZgiw74oQ1AqlP1pNYrX/MzLAPH9mNNDVmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NPg12Q8X; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NPg12Q8X"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B4C81C0007;
	Fri, 23 Aug 2024 07:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724399178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jUXXvNXe+C/jOh3YV5VxVlFc3LXkrVLLL3kJVjOEtK8=;
	b=NPg12Q8XAoQYgkNpJb6ByP3Vos8LW6OvrYoB1DD7gbF19FtWo/6BOz66IJVYJiI1P5ATWY
	saremGMqOKLw4X6D3KBgC/zkmGAfRl+Q4q0/XjXbf/15irVwDNZCYrBS3xFismntsni2md
	JImyhZ9dWoK+9Pd66sMmVsiAssQ0L6IrtfGNf1cWxd0F1Xsk+Vk/3581AevbYGCyx7mQFY
	d/bADZkFLIqt+tLbXYjueBxo2GpCBK+/rb8wK3FqXWxYR5AmAg1yl+7Fbm1FhzJsw+dR01
	mmS3FSe79HbLb3hs5R/bZb//QhNd1y92wlOMfZB1Y1x3I3AyRMdc9kAsAwWTdQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH RESEND 0/3] ASoC: dapm-graph: add component on/off and
 route names to graph
Date: Fri, 23 Aug 2024 09:45:58 +0200
Message-Id: <20240823-dapm-graph-v1-0-989a47308c4c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.1
X-GND-Sasl: luca.ceresoli@bootlin.com

This small series adds some improvements to dapm-graph in order to produce
a more correct and informative graph.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (3):
      ASoC: dapm-graph: remove the "ROOT" cluster
      ASoC: dapm-graph: visualize component On/Off bias level
      ASoC: dapm-graph: show path name for non-static routes

 tools/sound/dapm-graph | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)
---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240603-dapm-graph-8e3f7e3fd692

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

