Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075116;
	b=VDHn0rGgJVhmpT+PUuzazEIGdu2SNApA1MAvO1R1j09uffwipaCOFoaLfdQU8/FLVXsT
	 iuevtZUbEGKx1HffWh3kqYlPqVNKDcze8tcxFmWJ0z43bEr+Lqxdozvfl+9V81tp2p410
	 q0dW9j7AEkY0zCnzhHoEEWPfj68aehMPTA5HSI98fgckijyx0fRYk4IxzLFF518YOI/9k
	 iETt+E/DlcVhm5dY8tW1JcbNlr5Y2Yd8+U2eTWaq4TIZEBCE9VlAHkvLQYYCpim+PcMhS
	 QGHCpvgp1fmJyKSdEMPnWjCd+KunKiUP/b/KnxtvvaUmUxtFbTZc4p4kKB2mzgZAgfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075116;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E7ul2arr6XENd17+ogc5CtyqshNXPbPmSVo+aN3QCi4=;
	b=Dsz5I0zVKeqzkIPYfuelVnDU34dSHIgE86Pkj1HlP21KPFKPW3Rnilll0fTTjfwX1/zA
	 Saln6ipSgC9KnxXRKJL/VI4A/qZTMEg/766kOItyw/THCqHF0q2tLnsa4RYxkvpfcsPpm
	 tTNMR5lIUtSc2n1r92SDfqguIWgseOoL/5ZDoZYY1Hvr7hZa0IABjgmO07uxp7vCS9NT/
	 uGx0DGJwh7VXJOj2xu8Avf69ZtfZxBt+o8czdBtSgqkB5o2euEL9Va82UbYbM0HsUxVKr
	 B5wnjR7nuTd4IXgFi8V9/TpbNAlHngfzkpRZwOS8fHL1wVKlh2qon2T6UoMbmj1gDzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AaxlJOZD;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47732606A320;
	Thu, 19 Nov 2026 07:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47732606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AaxlJOZD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=AaxlJOZDWE1XQp/vmEVc3NShjnZfgv559FJ28Np3fobvcZDDb1+ZthRlFg/0Jp8eMHGXImLrkdlzU
	 1YOR5/Gt9o425YFwQ+cEKpE6n1T4CboeyYry0jFfAHec3nlSGRpbPuL1MMBoW6iXMa3eTT/qRhfgBK
	 dZuR+oNZYw28eAF4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16afeac28d2a-f785d;
	Thu, 19 Nov 2026 15:58:33 +0800 (CST)
X-RM-TRANSID:2ee16afeac28d2a-f785d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afeac26a8c-f54cc;
	Thu, 19 Nov 2026 15:58:33 +0800 (CST)
X-RM-TRANSID:2ee16afeac26a8c-f54cc
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: imx-audmix: Balance SAI node references with devres
Date: Thu, 19 Nov 2026 15:58:32 +0800
Message-ID: <20261119075832.50172-1-zhujun2@cmss.chinamobile.com>
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

Each successful parse of a SAI phandle in imx_audmix_probe() takes
a node reference. The card uses these nodes in the DAI links and
codec configuration, but neither probe failure nor device removal
releases the references.

Register a devres action for each reference as soon as it is acquired.
The card registration is managed by the same device, so the actions
release the nodes after the card has been unregistered.

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/fsl/imx-audmix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2372cd26ee47..8d7faa1b9cc3 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -10,6 +10,7 @@
  * https://www.gnu.org/copyleft/gpl.html
  */
 
+#include <linux/device/devres.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/clk.h>
@@ -123,6 +124,11 @@ static const char *name[][3] = {
 	{"SAI-Playback", "SAI-Playback", "AUDMIX-Capture-0"},
 };
 
+static void imx_audmix_put_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int imx_audmix_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -206,6 +212,11 @@ static int imx_audmix_probe(struct platform_device *pdev)
 			return ret;
 		}
 
+		ret = devm_add_action_or_reset(&pdev->dev, imx_audmix_put_node,
+					       args.np);
+		if (ret)
+			return ret;
+
 		cpu_pdev = of_find_device_by_node(args.np);
 		if (!cpu_pdev) {
 			dev_err(&pdev->dev, "failed to find SAI platform device\n");


