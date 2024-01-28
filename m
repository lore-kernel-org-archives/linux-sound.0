Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943423748
	for <linux-sound@vger.kernel.org>; Sun, 28 Jan 2024 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706448235; cv=none; b=Ek3SoBaetvH0tgGjlauTtUI9nNsb9nn9fPK12iDuI0YMiDit63dH7Fi6OywhA+eIRrIxTD7H5FPWs5wBlQpJvwaWo84O+bcaKg+z0dTyhac4GbeL1KxRh1V8ebSkD2LjKnXcLV9IcB57ViLBFYwnWSlwG4fk6ZvR7zUHb81B5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706448235; c=relaxed/simple;
	bh=4cDjDPkjedHuoh/97wY65WiJBcvxlTWmSF1jcwGfocI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTKpJWTkhVjPSAapHjeinDP/LwzXJZdPzbeUjyOqxFGPvNke1eNONvCcZBcosrGXKna8UqJ/wJWxGr20ErOxOp36qyy7kmerkNapzXcHXG6XRz/CB8dkbNkumKm9HGE7s6DaTvYVM7KT/qFZDLN/tTXJO+elGkJqMLgQRQygvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=FhWxVo28; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="FhWxVo28"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9odu2UuyiYdN2bxzL3xwVBJdoiSV6uBztzA/9+PP5GE=; b=FhWxVo28zS+1TKo2CJ7t1/JIvH
	7NEgqD748M+HJg3Shsb/a4QhL+oWSmism4JArFHFCAu6nfFzxvJhO2NC4zqnOKbrKMwxufbQygeia
	hwdlvd+ZAeYOvf7XIoV5wPQ+Vmqw08B/Kh8Gy5Qkao1chspMW2QCeI5NpxMBAyHwqsS0=;
Received: from [2a00:1370:819a:ceb:89dc:eced:962a:5b2f] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rU58X-00000000B6Q-0siz;
	Sun, 28 Jan 2024 16:23:49 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: usb-audio: Skip setting clock selector for single connections"
Date: Sun, 28 Jan 2024 16:23:38 +0300
Message-ID: <20240128132338.819273-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru

This reverts commit 67794f882adca00d043899ac248bc002751da9f6.

We need to explicitly set up the clock selector to workaround a problem
with the Behringer mixers. This was originally done in d2e8f641257d
("ALSA: usb-audio: Explicitly set up the clock selector")

The problem with MOTU M Series mentioned in commit message was fixed in
a different way by checking control capabilities of clock selectors.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 7b259641adb5..a8204c6d6fac 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -344,7 +344,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		if (ret > 0) {
 			/* Skip setting clock selector again for some devices */
 			if (chip->quirk_flags & QUIRK_FLAG_SKIP_CLOCK_SELECTOR ||
-			    pins == 1 || !writeable)
+			    !writeable)
 				return ret;
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
 			if (err < 0)
-- 
2.43.0

