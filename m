Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760051;
	b=3zgGMBcBmoHG1UFw0GZ3zLNQfwW6ZwOfo0cYl1FRI52+jFOnT+rJaeMtSTvOf/ME3mQM
	 PPtwWXuvKGpjRx+ayzlBgtvfDrIXx4gOFCTjw7pI35eBcjysknrXioJqBgDFaqbt0l3H/
	 jaq67yxWDCLioiF6ikrihL7y0VJhRKJ+8EsasrVY8IqZgt4UGkI0rl09WQjT6g32Y5Zni
	 s8iSQAryBDADIcan7rtN6O5JAdi3UnTtACpXe0h7NRfIvkBmr+OcJwPBU3OOlC1s5QJL9
	 uneT9yLHKl4n0tjE1xf3Eh7XEQrSwPXauoVY0qhriCxWhvgWyDpiOViTlRNoHpP2eCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760051;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=6wTAtoWFBdyw2/dbZ2e3Vc7Sps/cYBw7lqvN0VRWnmA=;
	b=yPc4gIegFGkaZT/BJo2Z3U9Zn7Xyl1aAyno/6BhCoPLlabpUFKXDk670DdfRPxIsDCok
	 Dk1EjMVsS9+R8PQiVDPk31xcXUT1RDEpGXTg2WP1Hw2NqusVwBo6KRWEICIqNdma/D+RW
	 x6Z8pKyHoTM7yNtoujO3rdteyrBdSo91+w11/0JTXNUNpIyOj028yH702P89HsTXAUzw7
	 YgaOYcjQzmvaZMVODadSY+M36mcJ/4xxg6avl9cx7QeD3Qzg7KTqJdJYbZ648gS2fnlEf
	 n5u+/54x3r/g3lPuuyRw4twwQwBeeij4YJrEuF1y6bCK89LIYUGkO4oGhnZ7Ja54/QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023D606A331
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B023D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAnUfsum+pqx7k+AA--.42079S2;
	Wed, 04 Nov 2026 10:40:46 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: audio-graph-card2: fix device node leaks in graph_count_c2c()
Date: Wed,  4 Nov 2026 02:40:55 +0000
Message-Id: <20261104024055.1508771-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowAAnUfsum+pqx7k+AA--.42079S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyDJrWxXw18Gr45Gr15Arb_yoW8ZF1Up3
	Z5Kay5ArWDWr48uF40vrWUJrZFkr47C3yrGr1UJ392ka93t3yfA3WUZr1Duw45CFs7uFWk
	trWDKa4xJ34UuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnU
	UI43ZEXa7IU0-Tm3UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAABA2rqY+TXVAAAsK

graph_count_c2c() takes two references that it never drops: the one
from of_node_get(lnk) stored in port0, and the extra one added on top
of the reference of_graph_get_next_port() already returns for port1.
Both nodes are leaked once per codec2codec link parsed at probe time.

Release port0 with the cleanup attribute and drop the redundant
of_node_get() around the port1 lookup, so that the cleanup attribute
balances the single reference of_graph_get_next_port() returns.  This
is the same ownership model audio_graph2_link_c2c() uses.

Fixes: 5f281c3e82b1 ("ASoC: audio-graph-card2: use __free(device_node) for device node")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/generic/audio-graph-card2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 503170578cff..f20301c3a441 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1199,8 +1199,9 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 			   struct link_info *li)
 {
 	struct device_node *ports	__free(device_node) = port_to_ports(lnk);
-	struct device_node *port0	= of_node_get(lnk);
-	struct device_node *port1	= of_node_get(of_graph_get_next_port(ports, of_node_get(port0)));
+	struct device_node *port0	__free(device_node) = of_node_get(lnk);
+	struct device_node *port1	__free(device_node) =
+		of_graph_get_next_port(ports, of_node_get(port0));
 	struct device_node *ep0		__free(device_node) = of_graph_get_next_port_endpoint(port0, NULL);
 	struct device_node *ep1		__free(device_node) = of_graph_get_next_port_endpoint(port1, NULL);
 	struct device_node *codec0	__free(device_node) = of_graph_get_remote_port(ep0);
-- 
2.34.1

