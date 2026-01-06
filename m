Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3582E1C6B;
	Tue,  6 Jan 2026 22:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767740336; cv=none; b=HAO9wFcF38OdpNDY2/WlQkSS295tVogN6OmggksZVc3wIDktB5TgLtZ4+oo25UH1vksBDOEsabS422u503GG0L3irlCmg6PnwZdeH02ZPMKCGKmHtKJaRKb0Cq12iPfIfFxqlsMum1iKnc6I84bCPx1pQpauSD9GW0QoLUTjeHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767740336; c=relaxed/simple;
	bh=B3ybUY2kJt1UOjks5U7glfq59GHfJsOrzDv4VR8p9uw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=paryOW2It2Xag+V1q0pw0NfGVana4InOXewIu7bi1gEsiAmw3qLgoHO6J+NqF1iBH6HCQvouM55lqyEA0ZyXUeuERxwrwc/YchhMbfyQZpDGW6ZCCjoFo76fmsHUCrp4RtR7Z0RYVqwdnblgrBRS1SW4FCrbGl81TCTmLLaUp9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=bkQi4wrZ; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="bkQi4wrZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=DD6NEUXxHPdS0YtFsEu6Vn46rChNhtMQwtuoQ/geHbA=; b=bkQi4wrZkR8vQX
	oIc/LBu2fmNPndVCPwdoZQrDuMNgLL5DEBz3Ljh+/jb4ECQEpLl/dVXHwfVz/02NlQ89LfRcGdHPg
	obSQcYEOW4yDj40u/q8MtuUkyNLwC9t9i64brX1jpDzS0GFi1CsK92XwTemsxGJcG4yj5nQTcAclf
	PPJzsjl4CDP2dgLnaG4GJ2lY97rQXUERz6WFQTy2t9GVByKg+KVioAavi63ydWIRNGSdE0+HUkMkX
	xfYJJrK5zHM+LrhHrYe9mgWYtulPtwvfYSsddyjkwd7hvrkFlyhBr1K+eJtqWN76JgJWF1oMK77Rz
	js0AguXMLM0wScFrxK8A==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vdG0m-008f4a-PU; Tue, 06 Jan 2026 22:58:48 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vdG0l-00000000LkH-1oYh;
	Tue, 06 Jan 2026 22:58:47 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] ASoC: ops: fix pointer types to be big-endian
Date: Tue,  6 Jan 2026 22:58:46 +0000
Message-Id: <20260106225846.83580-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

If manipulating big-endian data, make the pointers be big-endian
instead of host-endian. This should stop the following sparse
warnigns about endian-conversion:

sound/soc/soc-ops.c:547:33: warning: invalid assignment: &=
sound/soc/soc-ops.c:547:33:    left side has type unsigned short
sound/soc/soc-ops.c:547:33:    right side has type restricted __be16
sound/soc/soc-ops.c:551:33: warning: invalid assignment: &=
sound/soc/soc-ops.c:551:33:    left side has type unsigned int
sound/soc/soc-ops.c:551:33:    right side has type restricted __be32

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 624e9269fc25..ba42939d5f01 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -543,11 +543,11 @@ int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
 			ucontrol->value.bytes.data[0] &= ~params->mask;
 			break;
 		case 2:
-			((u16 *)(&ucontrol->value.bytes.data))[0]
+			((__be16 *)(&ucontrol->value.bytes.data))[0]
 				&= cpu_to_be16(~params->mask);
 			break;
 		case 4:
-			((u32 *)(&ucontrol->value.bytes.data))[0]
+			((__be32 *)(&ucontrol->value.bytes.data))[0]
 				&= cpu_to_be32(~params->mask);
 			break;
 		default:
-- 
2.37.2.352.g3c44437643

