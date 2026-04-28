Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA89A2836A6;
	Tue, 28 Apr 2026 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=143.89.41.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363984; cv=pass; b=eSeqFZJZwzvX9iL9DtiuV6Glqx7xX+XlEf6jNoeEI1Qx53roLfLrNTzI6j8L+O6Z9ykWkV1tAMwOGvrHB5gljhc8bQynKjHdsLymz9sUMz2V0sWXmnYNIh1oM7h6nPeD6At5Tdc9VvjDHbyVxD7to4x2TYg99jEx0UKtNaJ3sD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363984; c=relaxed/simple;
	bh=Ryc6BmtXeysPqdJoSHYeJgTaKXRn0FLhOlvkHIeVXEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8sj/U+Npwj7cyAaGO/2ja6o/o4yE4jTnlCwU5K2YDa/r76ElYBD/xwtoQbaS1TiuRim4i6LlVcdqL6FmBr84/q9eyOCPtPjkXKmni043oQelLKYmckuPYUA/NQD+LOmPmWECscmvfPCnieLpWloOq6OEyfbsCGJO4yyDX1eKto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk; spf=pass smtp.mailfrom=cse.ust.hk; dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b=N3y1ixkx; arc=pass smtp.client-ip=143.89.41.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="N3y1ixkx"
ARC-Seal: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256; cv=none; t=1777363969;
	b=BQAlDLAPcTFPtBCTr5rnAXsKmmB7SW+lnMKX/4BjUs1VyBDOXqLKxAmRL0TE87BLiOXM
	 GrU2p2j6TMqegO4veOl1g6ziHZkcW3cssxoxYydV8Shrs7nIWRiQwxjnYrUtXSKEiINuI
	 f1Pz2Z9+Pw6QHt4JMdaOre3NnGTeI+8FYs=
ARC-Message-Signature: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256;
	c=relaxed/relaxed; t=1777363969;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
	bh=4NxXpz8067DANuHCjerb6xBOiqKndzCOUE0ckvQf60c=;
	b=Jo9ODmek56vx7+lDwewIWrqGxBFIpwiaaVqSA38Oib/cX1eKAqiofMt8MTGeObo1G1Q+
	 lpSlF/UwofCNRcvGBMClF+mnrcwGcVhNTXvHRXPkMY1FHEsYf+5u/t4d0B48OR0JUgbFC
	 kWTrNAq9CY65suRd12Eo7KX3LT8iNYu4Uc=
ARC-Authentication-Results: i=1; cse.ust.hk; arc=none smtp.remote-ip=143.89.191.45
Received: from chcpu16 (191host045.mobilenet.cse.ust.hk [143.89.191.45])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 63S8Ch9x3248923
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:12:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1777363969;
	bh=4NxXpz8067DANuHCjerb6xBOiqKndzCOUE0ckvQf60c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3y1ixkxAmlEjzxsfaXFaGigj2KL8GwYE0NUiVcfPqVaUgaHEjYfW22Ylk2+dSVRD
	 Xyq6Ptf9K4B0wZOzdTiOQcy/dqRSyjEQ+cmpXbkhFZEM8wW0z2dzy6jkeSTOYBYSot
	 /fhFtbNWFOGEBV2Pz28EDHYPrrlS6V8MCIkDkC6Y=
Date: Tue, 28 Apr 2026 16:12:38 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda: cs35l41: Put ACPI device on missing physical
 node
Message-ID: <20260428081238.GA1659932@chcpu16>
References: <20260428074415.GA1632446@chcpu16>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428074415.GA1632446@chcpu16>
X-Env-From: sfual

acpi_dev_get_first_match_dev() returns a refcounted ACPI device and
callers must balance it with acpi_dev_put().

cs35l41_hda_read_acpi() stores the returned ACPI device in
cs35l41->dacpi. That reference is normally released by the later
probe cleanup or the remove path, but the NULL-check on
physdev exits before either of those paths can run.

Drop the lookup reference before returning -ENODEV.

Fixes: c34b04cc6178 ("ALSA: hda: cs35l41: Fix NULL pointer dereference in cs35l41_hda_read_acpi()")
Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index b64890006bb7019..acfccc848f82d82 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1896,8 +1896,10 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 
 	cs35l41->dacpi = adev;
 	physdev = get_device(acpi_get_first_physical_node(adev));
-	if (!physdev)
+	if (!physdev) {
+		acpi_dev_put(adev);
 		return -ENODEV;
+	}
 
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR(sub))
