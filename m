Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA30293460
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558737; cv=pass; b=HPMiLQKhzibrJM1ztmRT2DvwjKMvlZijPfVvTX+nAteZlUNa9qydbwHVJEJpIg76Lu6k0PWEnfe8sxkYDQEujSTDUgJ/r7I5JV/527EJ5rp9wcfqjVfAT1Mi+4lpdriqkMoOwVN43fIhQah6O80a96WAmjFcATBgo2aFHXhKLLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558737; c=relaxed/simple;
	bh=Rgu1yhTgtM3MoZgUUGFVIlYvkZmCHJgYdYSMjLwml3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AqEY995GKhz6QF2Cif17zQuelvuU3R4KNrdRh+D+LAS3hD8VqD4lviZXUlIKFaGrS2vXshtd50HPQ9jf/Six2G4dniq4EwZoh6cl3DgnVZCnnf1XSNgkTMk6qlmlGGAJSOyn/zPmTn6WgS8JRaPAUgVbsWW5mWRoR9ok3/v/cLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de; spf=none smtp.mailfrom=digital-rabbithole.de; dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=il663G/j; dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=7eCG1KUK; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="il663G/j";
	dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="7eCG1KUK"
ARC-Seal: i=1; a=rsa-sha256; t=1749558384; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nIYguU5e8gmt7odPAbx+IIoDRyP+IrHuPwy06Cj6mXhKiNuzi9hnIh6Y7vGgQ5iLgy
    VBJNe6kSJ3SR0qbmbraTnuCHlpW2KU4cT45a3TNQI4TIPjVO288m1fTJcA9o95t92nXq
    9DEHaNXU1kWtsCarVUhst+xISvrCmvjM11rGFRVgXoVQm1WytsDXrRWptdaOP7k+uypR
    84afG1AA2IuVDppcNclZhyNP97VBW8f33fuCHv1O6uFmcNQ52V6u3hw5o9bt7JGe5QU+
    GvJLVMP6w7W8t0xhDoky5FnnWz/iDG1Hopyds1TUtXvYHVtEfJjSDqM7Vi2HxLbelLwP
    o0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749558384;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=262BYOosQhL6gLXzBWJuA93WbeESJK0tahiI53YoCcM=;
    b=PwAK69jwZ3VYzXGfowQLkJL+Q4NbXMmAkQs2Peh7XvtLhk/MulYShKqqlvEIMv1xJD
    uhxde0haEDF6Rd6SDsvmdPRyQnQUJ/HdNkBcfiInxp/MroK/xPnXAjk6Wv1a1APbisqq
    KDMA9Hn4p33dlRVWbTxUjNwGEUHX5NKOrMJcQuR2MYzPJZSt3JICuKMYXk7Ln7prkR+M
    UrfMG0yaL0oA5p2IGk25gWesR57rEZGfF8ABtSLWhw4isLSBXbgj0+Vb3XwWhQ6OqZ6J
    la2GhO3gVpEMDcKdu+tQW2dEzaAjb/PIOIizShMstH0LEABLC2OuRH4HZX2u/vRdnblD
    SeFw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749558384;
    s=strato-dkim-0002; d=digital-rabbithole.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=262BYOosQhL6gLXzBWJuA93WbeESJK0tahiI53YoCcM=;
    b=il663G/j19DDG6JJ1BgyrA6zRnSORodnT+uJLvn+MIbbUuYjDflfdrAUzW7AYK0Qpf
    RGF2I6NLvQC+GhTqmAnNpM0nsXSQQ4F+Chn2KVZOADxj82jWqBg3ym3m24ayb9XQzZDW
    /WuzktpplOJ2aJWehGdIUcWLHmRRu9NBQB6DcC6yFN+d2S83spQgg/MyeLXCRmOhL4s8
    xRJlCehUOpeX5aICfJjJ2zixsHBi2czKFegNdUyNOWsMrX9iYVdAzYWDgVeW8Jzs7Ak8
    3Hpcuy3KruhdV3YuS1UXaqoX7IViL/yb8JiQC+LXwb9AOUhQMlsQzKcZfLlO+ikb2AZe
    RzFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749558384;
    s=strato-dkim-0003; d=digital-rabbithole.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=262BYOosQhL6gLXzBWJuA93WbeESJK0tahiI53YoCcM=;
    b=7eCG1KUK1/UqWQWdBE3PKry3gcqZ6o3sEk1UlPwB2JGKdITxaQ3KDr6vhg66cZU6Ic
    sFkirdm5VBKeVHslhnDg==
X-RZG-AUTH: ":IHkHbA68c+1zn2gb8+6dxsBP09h2Do/Zi4V+rbxtNBl2hCipBO6GPyNXZ6xAUEuHlZnKbp4UbhpDgteKQ1Dc5rYYRejjsEqb4WrQK85vHAG31zgy+09F"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id Y1c6d815ACQO1Av
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 14:26:24 +0200 (CEST)
From: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lkp@intel.com,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Subject: [PATCH 2/2] ALSA: hda/ca0132: Fix possible buffer overflow with snprintf
Date: Tue, 10 Jun 2025 14:24:38 +0200
Message-ID: <20250610122438.820-2-lucy.thrun@digital-rabbithole.de>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20250610122438.820-1-lucy.thrun@digital-rabbithole.de>
References: <20250610122438.820-1-lucy.thrun@digital-rabbithole.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100642.95jpuMY1-lkp@intel.com/

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

