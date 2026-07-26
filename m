Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCAD33B6CC
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 05:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785043248; cv=none; b=ohUBcNiBXGfzcLWaFQH6miB+hjRMUtI8ug83MEP/JSTwzhlBJerMViiRWm/bihFNsjEH++VHF/tFKSxVoAR8Fr/+hZM1okRVaqT/t2Hr+XonjxJcqpJqjmzzKYnY8d5bNeHW53tvi6rPdslIhHuL1ywiLDnfbYuj2pr8+kE6Ho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785043248; c=relaxed/simple;
	bh=HtSMDMGI928jH0NujTOiD8AsQWsclVnx98DBnmttboM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yxl3xrvePJ1SdKe8qWswvi3zSJH9HlAfIMxNDAJlapa+EOphIhzl4qyLC+b151BCy3QC23P1M2c+Knrgh0Uv0BUZ8Erk7A2JdEtIthXIPC3emsf7jRIpnQh52t6CdtPsfo3levovwyhhZkq6fz50c7k5DaS9IgFxYv9md7xbFWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=kMBxVfB0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="kMBxVfB0"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3811f512167so1539572a91.3
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 22:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785043245; x=1785648045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sCzrleFi3CRNOPw7//ouvrV2R9yWRR8I1g1qxqgqEw=;
        b=kMBxVfB0sAOI6HFADDOJDeKnHlNiBxGvzjepLDJmrn/8Gd12oKb6t2CTdpJOf7s5hT
         oxImNEWEbuPYw9VRED732tWTZ4/q1KKML10+8Xc2fsZ9BhoS1X+ohu5gNvixFrbcARWq
         IhPK7lcnrcB0Sh5Av0yZFAqyx3E6olDfZR0fcrxF0EaQ4T7SasUuUN6NgMXmj2mjTall
         GCHj7n/UHKa2XRz2UgweGBRHG50QkLoVCB+akuyjiXA647nOx/9Ev+5K+Tj9+JdBigwb
         eOL8aSujWkxwL6X1OfJHEfj1r0Ecv8L9MWGW/oTc3/bL6tupHibd7VxMvIenuntxpY+z
         o9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785043245; x=1785648045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sCzrleFi3CRNOPw7//ouvrV2R9yWRR8I1g1qxqgqEw=;
        b=q8dzXvRpsRpKze5Gu2TcerOE0nbyU+oRWzzUXUB2u6OhT3MQeFjRYQhEJnRMGIvTPc
         FJkgyC55mMzwGMJGjW3Wux4MRo7IPFkb2W1oNm2zuO/lRyCNxAt0OKy5YTw4LZxFjBo0
         CuXbog5QLmQ99AxvyMQWyamng5T/2YeM1PcSpQALvgbFr1V5oVQNwiwXD+LlkpojTCZ3
         7hCLnrOMo/cXTJwQet/BjHCD/muePqqTLGdwU5hpG23UXcGV0TXuu+L2UX7YT0/hXmbE
         S86svaqxMIItc53c3hwSdf3kh/zXrfUDHzKQvj/j3dDTXlBijdQrDAIKz5NZmd88Hcj+
         19fg==
X-Gm-Message-State: AOJu0Yy2G7wPzlaFRmZ0AXHXmLG4xsG7CB8W248KrLNsX334UXnB8b5N
	51tD8BFcdQExvNYYmKmt0qalgXgoxHtz5c3Yl42394kZ9CP3rxyqqLESot3Q4POsRQ6kj0oQRL5
	tPBf59Do=
X-Gm-Gg: AR+sD10VHhTa/iZCZ+gAolELuUNjPSn816IgS4lgJKxPo4MXxmAgrHFlcehOff/lcoO
	ZjXsz0nHRMSgvLxnOdYVZuk2dfHnhmfiwSJSkUMxzjGCd5rfMdMHyklKBmDfKOWatUQ/92iRy+z
	fqp/e5HwrP19jIO5JqeW3MT9sEqeTVxh0DroAPvlDFTJg/nG7SGHC/itEyZSY8/BrOhnKPsBb6P
	BPSg2Uo+QEm9dC8kMvg4ui99DJH60fundUvqTdiIXQ8Y/LTcpgSWRq+aGZjcT25Md1ZudZLPRci
	2GZ+mKHIQinJqwSfKBVQ9lHty+27lKInzZCaQdJ++88fpQy4v29E+iqWuE5W/XA79io2Ehu87DL
	/Sv1RQuDlwqaNu624dR+8uwPauDo3+U/LSDM/LUGktuJ2dwi/J/tEwaPNVc8r1WHmuQH2e5+cDD
	flJU3VA+mpiw58NnDqiepCJJRXgMqzR4wR8Y1XF/XoUwxVlxBRkHTzLY2/jW30
X-Received: by 2002:a17:90b:37c6:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-38f293cd1d0mr3812316a91.7.1785043244728;
        Sat, 25 Jul 2026 22:20:44 -0700 (PDT)
Received: from localhost.localdomain ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292ae889sm1469435a91.1.2026.07.25.22.20.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 22:20:44 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	clemens@ladisch.de,
	perex@perex.cz,
	federico.kirschbaum@xbow.com,
	Baul Lee <baul.lee@xbow.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: fix OOB write in snd_usbmidi_akai_output()
Date: Sun, 26 Jul 2026 14:20:40 +0900
Message-ID: <20260726052040.41315-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_usbmidi_akai_output() computes its fill-loop bound

	buf_end = ep->max_transfer - MAX_AKAI_SYSEX_LEN - 1;

as a signed int, so a small device-advertised bulk-OUT max_transfer
makes buf_end negative.  The loop guard then compares the u32
urb->transfer_buffer_length against that negative int: the usual
arithmetic conversion turns buf_end into a large unsigned value, so the
guard stays true and each iteration keeps appending SysEx framing and
payload bytes past the end of the URB transfer buffer, which is only
max_transfer bytes long.

A USB device that advertises a tiny bulk-OUT endpoint can therefore
trigger an attacker-length- and content-controlled heap out-of-bounds
write when a process writes to the created /dev/snd/midiC*D* node.

Perform the comparison in signed arithmetic so that a negative buf_end
stops the loop instead of wrapping to a huge unsigned bound.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: 4434ade8c933 ("ALSA: usb-audio: add support for Akai MPD16")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/usb/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index d87e3f357cf7..cc7df77632a1 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -799,7 +799,7 @@ static void snd_usbmidi_akai_output(struct snd_usb_midi_out_endpoint *ep,
 	buf_end = ep->max_transfer - MAX_AKAI_SYSEX_LEN - 1;
 
 	/* only try adding more data when there's space for at least 1 SysEx */
-	while (urb->transfer_buffer_length < buf_end) {
+	while ((int)urb->transfer_buffer_length < buf_end) {
 		count = snd_rawmidi_transmit_peek(substream,
 						  tmp, MAX_AKAI_SYSEX_LEN);
 		if (!count) {
-- 
2.50.1 (Apple Git-155)

