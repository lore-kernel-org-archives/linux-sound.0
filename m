Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3972BEC43;
	Thu,  9 Apr 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743557; cv=none; b=Ms6PWlF7jBFtADsU+mzJDqPe+mMOxhtmR+nTOGxr66K1WUWIoefRi+90MyL9Bss3l/olkKE87tvsZvaK5t9wWYanrQPofFanlLHupOG9GRZH/rf51oZco3fzBiZOGUxRHWd9z4ryc/Eqi5konNCpi3PM0bklPv3VpJcTHUxyv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743557; c=relaxed/simple;
	bh=R67Uo3vcjWY0CAQ6VGrugKjIzNUNoQ4Ydq3BP1psbFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjEyCVwkMwjH+tCX8ABY86obtjjSYZK8wCjtV9jBn7Ucr1/bLmViyk/SY/zcRoad0HpYH8RGg7gMV5wTwmChnN+hLJBr8+bWHg998B9Zgca3HHcGrOBUtKo+FSmfo5LLbYrtEwq0rAArKO+wj6pMs/gukYyw7keDTe8/XryjyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nabtkNB5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nabtkNB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D676EC4CEF7;
	Thu,  9 Apr 2026 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775743557;
	bh=R67Uo3vcjWY0CAQ6VGrugKjIzNUNoQ4Ydq3BP1psbFk=;
	h=From:To:Cc:Subject:Date:From;
	b=nabtkNB56tLIBhsnCmFQsukPVjHHm9Fo87qNxlAjQS33WuQiG8FUuuN5HohSyI3eP
	 LxtmmIsFNElfWC7mudzjcbkWdBWPH2N/QVgRQhzRMZ2d/TjWhPEWEqYuXmLcERCMLw
	 PDdjE46TIcSlEpbwMuqGrCyofYOMriq57ytEaOVw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	stable <stable@kernel.org>
Subject: [PATCH] ALSA: fireworks: bound device-supplied status before string array lookup
Date: Thu,  9 Apr 2026 16:05:54 +0200
Message-ID: <2026040953-astute-camera-1aa1@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=R67Uo3vcjWY0CAQ6VGrugKjIzNUNoQ4Ydq3BP1psbFk=; b=kA0DAAIRMUfUDdst+ykByyZiAGnXskGiLz2QIBk9L1IQU25aSjgFPDZgmXUFQB60Qm3vyHped YhdBAARAgAdFiEE9LYMxb94wiFKMT3LMUfUDdst+ykFAmnXskEACgkQMUfUDdst+ykP1wCgyRPc tJWfRxj91tFfi5FQN9Ra8q0AnRsB8/cPvAqHm/chhciDmkE15mmQ
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The status field in an EFW response is a 32-bit value supplied by the
firewire device.  efr_status_names[] has 17 entries so a status value
outside that range goes off into the weeds when looking at the %s value.

Even worse, the status could return EFR_STATUS_INCOMPLETE which is
0x80000000, and is obviously not in that array of potential strings.

Fix this up by properly bounding the index against the array size and
printing "unknown" if it's not recognized.

Cc: Clemens Ladisch <clemens@ladisch.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Fixes: bde8a8f23bbe ("ALSA: fireworks: Add transaction and some commands")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/firewire/fireworks/fireworks_command.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/fireworks/fireworks_command.c b/sound/firewire/fireworks/fireworks_command.c
index 2b595ee0bc35..05550f36fac5 100644
--- a/sound/firewire/fireworks/fireworks_command.c
+++ b/sound/firewire/fireworks/fireworks_command.c
@@ -151,10 +151,13 @@ efw_transaction(struct snd_efw *efw, unsigned int category,
 	    (be32_to_cpu(header->category) != category) ||
 	    (be32_to_cpu(header->command) != command) ||
 	    (be32_to_cpu(header->status) != EFR_STATUS_OK)) {
+		u32 st = be32_to_cpu(header->status);
+
 		dev_err(&efw->unit->device, "EFW command failed [%u/%u]: %s\n",
 			be32_to_cpu(header->category),
 			be32_to_cpu(header->command),
-			efr_status_names[be32_to_cpu(header->status)]);
+			st < ARRAY_SIZE(efr_status_names) ?
+				efr_status_names[st] : "unknown");
 		err = -EIO;
 		goto end;
 	}
-- 
2.53.0

