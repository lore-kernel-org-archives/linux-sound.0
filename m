Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C06236424
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578571; cv=pass; b=cvsK8yfTUc2yb7MuOlIGvywrsn84bKHrk+vzPnCbrdq3qh2ito4wanVVSiBHNTiNbn03qt9605iDrFG81h/T8j8ChR1Yd3eO2V0V2dt8z2XQw5CmVpcEXBRzh0COaFZWQfdmUO63ymPNi52MzztMQrqvj6WwnJYLnDZprLH5XZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578571; c=relaxed/simple;
	bh=e/FaYhB3HkTHURkyM2WFMSiQ52kBNTMlOwJZH1piPxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUPZvnVB25k8VDKCNzPCylwthcwo5rU2aEPkRZCbVHlStXu3VWBHWgwjIznauNqgfylewubUGTtSI43U+VMWlQ9NBwG83W18qUj8lHSABULntyacQHyYqJxRxPbfJk0488YPl/7D4xHam1vp07bNVDkqtWWkoqzJFFe5P34zyf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de; spf=none smtp.mailfrom=digital-rabbithole.de; dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=n/TGi//h; dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=t5DQqbNt; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="n/TGi//h";
	dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="t5DQqbNt"
ARC-Seal: i=1; a=rsa-sha256; t=1749577867; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QwwWCM5EAMIWojN/FrK4LobEkp43KCID6nZuXkTt6PUVKOV0IG5+MtLrx6o1xCNGN4
    asxmEJ0zaMr6qTfVzFxsxtAd2YeKjG8Rt0dgw3NSMLqaYU08WWOip/cihHPYI51n8V22
    1iVHxDLWzfY5vQZbFnY2HnmFwR51WFgBcaUPZNsgYN1diDmvs4mQ2LqJy8euMItwyxfy
    g2udeMLuETlAXsDuvXMuFtKgzxUZv5xkIWDgw1CpEUPwHPpCeKHO6fMmfvIn+/mySXlN
    VV/Gc3lQWg5oAplGBm71HELEFPQNTmwrsoQmBrvTwtAn9SrNRYT130Vpq7FoVJE2hdg/
    qerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749577867;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=LFp6nnAx0S5v64FS8/IsZyVPyoBqJx5oNsblu5xaEbU=;
    b=KKdQm03KFOxExlvTjhXsbCjFH9zkXyz7FXofK84u1fgnIa9ZCO31wyeSpSgWeyGuDS
    /sJ8jHr4dC/V3psrbyotm/a0FX1u2WEPhlmpDihIEA9NtO8eD/Ga+mrUolKf5ArOCovh
    nrOX8frLoVByGb2QoR6nambPKgd9WXmSn/il1ePbudLZj2cAncgUbonDfYT+Vz005VJn
    bnE17l7jns7l5gulRGhdC0ak3sT03ON2vol9QAlgTNoYcf81tIAm6v3FXXvV9rsh8wwL
    /of+Lgt/fz+5xDuY4zLRjQGMJNKxfAFop3JqVUAX57/KuvXb7bnvTfAPuISzXbkDBQ5g
    AhiA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749577867;
    s=strato-dkim-0002; d=digital-rabbithole.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=LFp6nnAx0S5v64FS8/IsZyVPyoBqJx5oNsblu5xaEbU=;
    b=n/TGi//hfSSsvFQbAGh3VUJpvCwzwaiP9Rf3hTIWUDnmPib5a2icNUrj0KUfGfud1m
    qd/R7vbcnLp14uiM44rb5cFwbIfOZ7i9u7Mu8U4/rto49vrPadGRj/2+p+gKFmG+3m3P
    hAOeU5RdKIW/nOqKVnT5Np/iWudbHvqBkzqHp2FiFEAnc1w8dflyTqOAUA5m5qVNdrUu
    6nNw1pn4GBetC1Nz7wuA1QjDdjrfd30oIZ04p5RiynIsY5WeUmv4laL4/zSINn00l6iu
    BJ0M6V1ULr39qM2wKhHf3n7W4mJkudXlBdU3SJm3CezvEDVJ9gMsnJ1rvm6M3Es7An87
    pEcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749577867;
    s=strato-dkim-0003; d=digital-rabbithole.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=LFp6nnAx0S5v64FS8/IsZyVPyoBqJx5oNsblu5xaEbU=;
    b=t5DQqbNtUtjYMnUU+sjfBNKTJEFWU5VoOtdUfj/y5b8iXziYskuGdQKqjXAvQUZo1W
    nqftLpZQmuGoDM4XhNBA==
X-RZG-AUTH: ":IHkHbA68c+1zn2gb8+6dxsBP09h2Do/Zi4V+rbxtNBl2hCipBO6GPyNXZ6xAUEuHlZnKbp4UbhpDgteKQ1Dc5rYYRejjsEqb4WrQK85vHAG31zgy+09F"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id Y1c6d815AHp72d2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 19:51:07 +0200 (CEST)
From: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Subject: [PATCH v2 2/2] ALSA: hda/ca0132: Fix buffer overflow in add_tuning_control
Date: Tue, 10 Jun 2025 19:50:12 +0200
Message-ID: <20250610175012.918-3-lucy.thrun@digital-rabbithole.de>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>
References: <20250610175012.918-1-lucy.thrun@digital-rabbithole.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The 'sprintf' call in 'add_tuning_control' may exceed the 44-byte buffer if either string argument is too long. This triggers a compiler warning.
Replaced 'sprintf' with 'snprintf' to limit string lengths to prevent overflow.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506100642.95jpuMY1-lkp@intel.com/

Signed-off-by: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 491d45d652dd..1904964591db 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4410,7 +4410,7 @@ static int add_tuning_control(struct hda_codec *codec,
 	}
 	knew.private_value =
 		HDA_COMPOSE_AMP_VAL(nid, 1, 0, type);
-	sprintf(namestr, "%s %s Volume", name, dirstr[dir]);
+	snprintf(namestr, sizeof(namestr), "%s %s Volume", name, dirstr[dir]);
 	return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
 }
 
-- 
2.45.1.windows.1

