Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C332D5436;
	Sat, 22 Aug 2026 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424932; cv=pass; b=eI+DlKbNX1rPRV+h/5MvT2eI5DRbG58kwdR7HsXHlJqqW9nQqsnhujgeNnGggSEz4XpqzRyWzUy4wwMFXLe7XhYqYxtH7yx+tj0mEeLJPofE4HdUJpOOO2dL69CdP6ycv2b4fnc06nykIsoVPjrgFqaa0CPqvezepEXTO7ODrsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424932; c=relaxed/simple;
	bh=DtUzewz4kPWCsaEI6F5G3C8sTFGQByZppVyaSTNJogI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mmp+ZSzt1IpunmwzBY4lANRagHSCj0sxl9HOHLIHDEkfTrN2EVZ0TKQ7YP+7yh85vswuanueSPiDytCF5tr7GwpOLnWdF5IfF7PBwv/0RJDJpVgTmnDjSyx84mS45uGEa/NtOLgzch0fppOiqzTAFhCrmRqxXxhAfovT5m6OufQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=dxxV+VuU; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="dxxV+VuU"
ARC-Seal: i=1; a=rsa-sha256; t=1787424797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NrOLy/73bsqy0rF0ewkTpbhm0fEKME1WuhJ6d4IznUreVjVnh68h6LF30mz6Ph1W8MXkvFdgHnqBt6mjsJwq4dUM3GujoMuUxJUb6HB92t86WAURp2v6VZz1bt9/iiRD6AnltFzXzIh70Cw2BGBZ2GZkISQ+Xx/uEwFv3Cuc96Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787424797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q8+AIGPDn/JT1v8hFgnJvEM7aLOu5SjphAk6HaDD/Tw=; 
	b=W2qHA33ZeT7Il3iu16IxpI6jFibcYzIcncOdyV8VkRcqZ4yhOe1Qa8fKly6AShUHNyi2HH4f3buIqx4oRjYemo+oplWkqjcDwe3lraDjchJajns7lsU6fRJ88WQAc3JaCPPdUj/TfJXGxNuX3WF+MKzdlNiegp8eXJkg8N42Dmo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787424796;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=q8+AIGPDn/JT1v8hFgnJvEM7aLOu5SjphAk6HaDD/Tw=;
	b=dxxV+VuUFyiHqiQCeAOoT1fvPosqxyHragNEm8gsLZV14Ega0jewmh8nBM5zgvvF
	ZyLLhZv9yjmA4O+kK4KtK7U/hExLcla+U9DqmY7hzIEPGJiI83xrd4LUxQINhAhB52D
	KH4B281mqqJBvZogrWELlNGyt/h1FLN2i8VOFV3j5oZkzxIj9G5gJyYkr3WYOXpHk+B
	FL4WOmBLfMv6KQkQpPbj/l8Irl470txto+Fm4ienDisU6OXOuz01glvH2yChMyMZgnz
	LmIj8Y+Gr0n9RyqpJOmAC1gqB27RuOTbxJSwAb48o1fIkanv+Dlf14WxW0GM6xwsRNl
	Od0pFU9V9g==
Received: by mx.zohomail.com with SMTPS id 1787424795955118.86889977473345;
	Sat, 22 Aug 2026 11:53:15 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 23 Aug 2026 02:52:31 +0800
Subject: [PATCH 4/4] ALSA: usb-audio: Add quirk flags for Logitech PRO X
 Wireless
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-uac-demote-sticky-check-v1-4-a8cbe572edff@rong.moe>
References: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
In-Reply-To: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Niemeyer <adventureFAN@gmx.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

The Logitech PRO X Wireless is a wireless headset with a hotpluggable
microphone.

Its Playback mixer's GET_CUR somehow becomes broken when the microphone
is detached, so set QUIRK_FLAG_MIXER_GET_CUR_OK to prevent the mixer
behavior from depending on whether the microphone is attached.

Meanwhile, the Playback mixer's minimum value doesn't work properly,
thus set QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE to prevent userspace audio
stack from using the minimum mixer value to tune volume (setting it
when muted is OK).

Reported-by: Alexander Niemeyer <adventureFAN@gmx.de>
Closes: https://msgid.link/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de
Closes: https://msgid.link/7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index b62168a11e32..1e5a261f9c10 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2254,6 +2254,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M |
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x046d, 0x0aba, /* Logitech PRO X Wireless */
+		   QUIRK_FLAG_MIXER_GET_CUR_OK |
+		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */

-- 
2.55.0

