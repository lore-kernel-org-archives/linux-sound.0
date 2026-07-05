Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C65286891;
	Sun,  5 Jul 2026 18:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783275592; cv=pass; b=l3q6Qgi+kX6awelB680Ydpfen52DWCoCdFBTwexsX7oPmgqtFdYAnDhiUi0TtKpF9ghWRokm+hLGesxyfbM2Ifc620+jz+YORj0fF3CJ4zk2F0BxOPRgEeXoXRmS3Cx93uHM42kKZB7q/u29MBohpl/3Ijy1B3Myb99JNenOi4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783275592; c=relaxed/simple;
	bh=AZ0P480KF/V0WveWTwp6v1RIcw2prGoCda+hSs6YK+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o4enCaFK8dg3Fg7n49yY7ANaqfx4za4GCSZNz7ZS14P/7pT/XDKmhy8xVslHr4FMq95Hu4C2ajF6dgJoRWwlTIWv92GNqWB0ZUKqb0BbOzaQg4KDpgrEStISgyT10lcteRRoqQnxDOmMK1kHLdBtFLhbF3wTze/T//qcvzUhfak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=KEGXXoUX; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="KEGXXoUX"
ARC-Seal: i=1; a=rsa-sha256; t=1783275585; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IeNyDLqGAG6gGbkyjDkNnhPUEK/qFIL2W6IIJ9ZS76tE3FumZlYZNqDw5XZyL/BbKwAGxo97lGceNo8Q5N2dUki3LciDx2/kT6Q8XD+6TVtScbKbxCTucipY3M4kzth9uOCAdii5yEsEN9bDJN7Z8r90vmvBTPm5DFncGp/bW3k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783275585; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gujNh9G+9M5lj/xIOBFbwcy0wHOT+eb8ih8LIp1MREk=; 
	b=Q6iZ8O5IC/fitAePkhpLKc38l0fENQkiS2BnVdZQpncxZV2dtw2mC6qTEiPX8axypDx0VF71GSn1zjz5vn5ZPVarJK7FGp6dgMjizUkgX2b7VebkAI+SfbWJTqivBoc7LlIBUm/ka4A+RCQeXHL0DlTvIZcf17Z3cmqZB4I1JyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783275585;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=gujNh9G+9M5lj/xIOBFbwcy0wHOT+eb8ih8LIp1MREk=;
	b=KEGXXoUX7g33UDp3VAedpywBmoUkP5APPh9CaOZwhwr0azNauKdShBkD8mAL96kB
	082GAOVgWfsPGnhj3d1t7jvhky8lpHZXahSmyV5Ih6JXa6AuZAoaL8OYm2gwvLb3zKk
	8grHDuaiBmmC7H6MvR1me5kac7wGfg1saCom77TPfVGYfTo4pbGwvU6MfQKOoqiPnM/
	F9+ExtPPFOTwCaZwxagMOCSEHxuqOqR4jHvupLMFHccqVdd1nqNZqCOLOFIqAwT5l6i
	BuEG5h5eMoCDD3bvlRrTPD/76txtnYyBobQDOkcXuwllvkktfP3O2iqxrRAzGSVX28d
	awkPLGbj3A==
Received: by mx.zohomail.com with SMTPS id 1783275581860184.3430519611062;
	Sun, 5 Jul 2026 11:19:41 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 06 Jul 2026 02:19:31 +0800
Subject: [PATCH] ALSA: usb-audio: Fix imbalance per-channel volume of
 sticky mixers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-uac-sticky-channels-fix-v1-1-92741c538283@rong.moe>
X-B4-Tracking: v=1; b=H4sIADKgSmoC/yWMSw6CQBAFr0J6bS/GyEevYlxA80ZazWimgUAId
 2fAZb28qoUMUWF0yxaKGNX0GxK4U0bS1eEJ1jYxCbwvK1fwUAtbr/KeeT8EfIy9TuzO3l1yaa4
 CoWT/ItJ8lO+PP9vQvCD9nqN13QAp+9/yewAAAA==
X-Change-ID: ceff7816-uac-sticky-channels-fix-12f145cb9cec
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

I accidentally made an off-by-a-line mistake when mimicking other code
paths that set all channels. The mistake breaks sticky mixers with
multiple channels.

I didn't realize this mistake at that time, as my device's mixer is
single-channel.

Fix it, so that per-channel volume of sticky mixers is balanced.

Fixes: aa2f4addab44 ("ALSA: usb-audio: Set the value of potential sticky mixers to maximum")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b4c855c25eef..703c118f9d4e 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1473,8 +1473,8 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 	if (!cval->cmask) {
 		snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
 	} else {
+		idx = 0;
 		for (i = 0; i < MAX_CHANNELS; i++) {
-			idx = 0;
 			if (cval->cmask & BIT(i)) {
 				snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
 				idx++;

---
base-commit: 7404ce51637231382873d0b55edabc2f3b841a9d
change-id: ceff7816-uac-sticky-channels-fix-12f145cb9cec

Thanks,
Rong

