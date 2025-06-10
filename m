Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91482918C6
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558377; cv=pass; b=q2IX9JinhnqwAZ/ShaXkufuRsh3ZaCcajbyurRfo4zLy1SaBcIq0x7xsQInyTw9BhLWKNEKk3zpDzr5rUmzQz0ET8dWeePOZN8cAhbBDiVWYzpf8wGz0ZiCGj+ujxnAgQAGS8qqYCy4QE8MruYegtqf3LYxtXivdbJSaYCvkALc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558377; c=relaxed/simple;
	bh=6xLYooeRA4v1nOnqvUH+TKkf8pa4qz9qpvIO6l0iu00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DMtklZxfk4URcROd7gyG41oKnV7W/gMQrnYdy22vz/M1Y9DXENjschJiKshmUSvEI36IJdiLLYgAPNcEYl3811jdF6oNdJLPlsFi+IPIplYH+EeAKMg7TSdaGEMUH22sXxNthv1gzO5PkuDTwskvAayvZCYQRamPJHLVrp50RuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de; spf=none smtp.mailfrom=digital-rabbithole.de; dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=e1oPepRb; dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=rf7y+tDH; arc=pass smtp.client-ip=81.169.146.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="e1oPepRb";
	dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="rf7y+tDH"
ARC-Seal: i=1; a=rsa-sha256; t=1749558362; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Gzqx9Vv77/ITz3xzr7gfTeRE2msFWDZyfmXIc422/feLVGL3r8IBvphqLK9LArZYVO
    PmB46mThlIEbZc9phT/yC23e9SL5FQ3eyPmMRxVfxyeGrP12IhaWMIW/7RZ6n473Tfbg
    WapqcPbIoZbkpXfrcJ3cg8J4EXC5QJzUVG5eqO9gMgPRhs965WSBeoierrFY945JQKFl
    VoBc4H9HWwYhspBcx5ty4svddz8Oi+SHkCwffyg+U1zmGA22xiVg7YImBgdmqJuX4DCj
    u0u0zlExOWpAwWiI4H05AqarhLh+hI3T+Y9Cjog6aTyjBbbd3syNcB+VRXq+htFc8LC6
    4NLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749558362;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=lgoLDHH6/IbbZyRF1opII5a58KtuvLvjhXM9JGYxa0s=;
    b=nOZSDaIUki7IaVOgIbtMUo2MkVOtUzUP2TU3tW5g15jjigoq70INqA7JH1ZQbKjKrg
    qrpUh3x/NOt/25nM/SYp8bE4SffKvC3LP9F8qHQYOCg4M+VOb5tCskTC9JB37xPHJb/K
    tNShzNqx3pNtq57iZhUnRdd7Xc3dzY6GKq3L05HHLTdeYSGeLtdIsuglmgVqhXs0aCAo
    NyQv3CkRMFDZCn7N4+0t0PZivWMrvwMuyhCiantWvI9LQc2GNSZBodq3adBKPFXyd//C
    HW9muA1dhmhNtaMiNsoxCehfBot2QdQAOmYrwvDZcPnu6FTk9AHz5ZKBoc9u/L0ofvaH
    y/lA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749558362;
    s=strato-dkim-0002; d=digital-rabbithole.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=lgoLDHH6/IbbZyRF1opII5a58KtuvLvjhXM9JGYxa0s=;
    b=e1oPepRbB1WO3MUsThnXEuxer76X6PEdx0v9SudEp94R4K6h4bi1AAAN81K9x9R8PY
    LOWi85NpxCkNC/DbQ4eG0EKF3do8UL9eau7jUpq9U/bx37lGqZLKo0yrHs8RS1QYPyqz
    UTm9OdiF6Ae0T3K5esMQNVmN6kmFb63w/8MGd40pWKAfimc1ULZ6k8Dej5oLMOIG9HGe
    h55Wre0jewUYnYbIUYKnGRX5D7Sbt8e7kjFYJJ2IafKpeAc62DBrCdTlQGC4Ko3Ma6Sl
    vySMUQ6/3YBwddgXXBOuwJHznBSjaCd01MliD2YZHY58ygKnvgo096IS4jW8QN2pmjwI
    vDhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749558362;
    s=strato-dkim-0003; d=digital-rabbithole.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=lgoLDHH6/IbbZyRF1opII5a58KtuvLvjhXM9JGYxa0s=;
    b=rf7y+tDHwJQg0NswWyyvWTFSD+TGcpeQ20y1Zt9z+XBBOKYpRqPdzpxcrMyrQ4LJeX
    yxpn7D+cicjnkJPfAPDQ==
X-RZG-AUTH: ":IHkHbA68c+1zn2gb8+6dxsBP09h2Do/Zi4V+rbxtNBl2hCipBO6GPyNXZ6xAUEuHlZnKbp4UbhpDgteKQ1Dc5rYYRejjsEqb4WrQK85vHAG31zgy+09F"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id Y1c6d815ACQ21Ap
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 14:26:02 +0200 (CEST)
From: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Subject: [PATCH 1/2] ALSA: hda/ca0132: Use NULL instead of 0 for pointer assignment
Date: Tue, 10 Jun 2025 14:24:37 +0200
Message-ID: <20250610122438.820-1-lucy.thrun@digital-rabbithole.de>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100842.d8lwwdwU-lkp@intel.com/

Signed-off-by: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
---
 sound/pci/hda/patch_ca0132.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index cfe422a79703..491d45d652dd 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4385,8 +4385,8 @@ static int add_tuning_control(struct hda_codec *codec,
 
 	knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
 			SNDRV_CTL_ELEM_ACCESS_TLV_READ;
-	knew.tlv.c = 0;
-	knew.tlv.p = 0;
+	knew.tlv.c = NULL;
+	knew.tlv.p = NULL;
 	switch (pnid) {
 	case VOICE_FOCUS:
 		knew.info = voice_focus_ctl_info;
-- 
2.45.1.windows.1

