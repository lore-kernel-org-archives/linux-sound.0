Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075099;
	b=GU/3BLBl1bEMN7ZozNI3IMM19siyDz6CKf4BdrH+dFPy5LrapLp8tSpRzxS9hADEYl4i
	 DeNB0s+h8wk/08h/0vikaqgXRSumMnj1MpOS1dVKxKQoMyCae//Sopwlgwp5Ap+Ca7Rd8
	 obXKoBGA/AqOb5pVqai35EIqT8dMj/+fbCR6osobneIiYtWsh4mZbhdLGEcGHRgKlfJNQ
	 Av0DfZMeZmy28RuzQPGYJJw3Z5egHe1eCGbBGLZaNTyfVzwu6mP3FY2HiSOKLuJJ/iPiM
	 J5Joaq+SEeBx9Y8plq5Wpi344M14gO1AQHeN+gMuWGAQbMJGJAtvhpF7fIuA4vF0w9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075099;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v3ccLLF7atNWblKk/enk9BxIoPVTWQSChaAEQnlXYAA=;
	b=ffeiKkP0VWgChZWjGAXP8mdj0xPpSnz4aehoxOR6q8NCigcgP82Deq4FTZokgDvjW49s
	 yA7oPoLfM112ZOeDkcpgWyT5doHKwWz/eZAw5x2W9F+Pq31hq0MKhzpbdmRICU+iuaiGu
	 pOj/HrmwFWlOZnhX/h5+VmshRaHIcDOlFGiJTFHx4vSzQAO+GQHWJLc9M3bp335AjgOAQ
	 qAkPA4Aq6v/it8FD63fP4m2lZwA5fUMtW+c47ku+AtOF+32YPlQuOb1JA/9e7Z0h4bsGJ
	 ofxFLp1bv++Xp0kSOxJ8P4CIAIaqcbEm5PxD/lplcLlPZn3v2XXjfXsOV4QWUSwtS/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="mVX/+Z5j";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51718606A320;
	Thu, 19 Nov 2026 07:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51718606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mVX/+Z5j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=mVX/+Z5jvEtW38QSHDp2bY0u9FHDndjid98mEhdfrXFMdcqJqxdijl+fMxMQ4Db4BqNKa0B/lOLk/
	 +wk74XiLTM946E4DY/68NW4v6qOBKtpFvmZUFW+swGXFe9cocdC+d3iP0t8eFz75FxffW/tJZk/+E9
	 GGbOJCkaJqgEZjTE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afeac0c3b3-bba6d;
	Thu, 19 Nov 2026 15:58:16 +0800 (CST)
X-RM-TRANSID:2ee86afeac0c3b3-bba6d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26afeac17c71-f5877;
	Thu, 19 Nov 2026 15:58:16 +0800 (CST)
X-RM-TRANSID:2ee26afeac17c71-f5877
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: audio-graph-card2: Release multi-link ports references
Date: Thu, 19 Nov 2026 15:58:15 +0800
Message-ID: <20261119075815.50155-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

port_to_ports() returns a referenced ports node. graph_counter() drops
the pointer after counting the ports, while graph_parse_node_multi_nm()
compares it with the expected codec ports node and discards it. The
references remain held after card parsing, including across reprobes.

Use the existing device_node cleanup pattern at both call sites, so
the temporary references are released when their scopes end.

Fixes: e2de6808df4a ("ASoC: audio-graph-card2: add CPU:Codec = N:M support")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/generic/audio-graph-card2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 4708bbba1a3c..210c789d4b7c 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -559,9 +559,10 @@ static int graph_parse_node_multi_nm(struct simple_util_priv *priv,
 
 		struct device_node *mcodec_ep_n __free(device_node) = of_graph_get_remote_endpoint(mcpu_ep_n);
 		struct device_node *mcodec_port __free(device_node) = ep_to_port(mcodec_ep_n);
+		struct device_node *ports __free(device_node) = port_to_ports(mcodec_port);
 
 		ret = -EINVAL;
-		if (mcodec_ports != port_to_ports(mcodec_port))
+		if (mcodec_ports != ports)
 			break;
 
 		for_each_of_graph_port(mcodec_ports, mcodec_port_i) {
@@ -1117,7 +1118,7 @@ static int graph_counter(struct device_node *lnk)
 	 * ignore first lnk part
 	 */
 	if (graph_lnk_is_multi(lnk)) {
-		struct device_node *ports = port_to_ports(lnk);
+		struct device_node *ports __free(device_node) = port_to_ports(lnk);
 
 		/*
 		 * CPU/Codec = N:M case has many endpoints.


