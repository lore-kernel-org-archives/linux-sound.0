Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F52D5436;
	Sat, 22 Aug 2026 18:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424847; cv=pass; b=P14mcThMVwwTnXlYl4XTj1LcUJ/F5h18VE2yKjSv68F/foI/Hl0wbTCvbJVKOORDSJgzaYbED/ZLTYJ6ovff3FQQU2foA6t1umOvHLx+jUpB5F7FlHU3zoIIS7Oux/jmqHZX4kRYefIFrbQ/6OH+F6BIOVVwwuv22qu3NpV2Gas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424847; c=relaxed/simple;
	bh=vp73JAFJfvYEdEdNHkA9mu3yG0xAcRU/EH2Z3zmIa/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngoCc/BcKmyaDfJALAbHHBnJWdIuo18Up5VDYfQZzJzrHW0czw5XJdJmn/L2V7wqSJX/c42Sz7ZBrKjQgzeibF4Lr6stjlBcxl3CRYpH6mZWylwcbpfx/5bFsI6Oq6Tc3r6MoENEZa0CsXZdGSJZqLx2cODP2yCMJthpfzJSxiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HQ4YLwSy; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HQ4YLwSy"
ARC-Seal: i=1; a=rsa-sha256; t=1787424778; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nutZaZ9k9DvxShthnlxXQuI1WAjn39hAWwRaDEBWtAv2JNMXORPTYypisuipd8qJQYlH19tF0Dl7ATrMAKNUT5aD2uNoehDouBafPIuiXkYKwpjwLupjGv1dgVhiOII1NhvtqpwslwVoJeZ/JY+oQXgmLgG71Ru/2/xKnNmyC6c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787424778; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z71ZUpT6ZJIEHaxndlECyET5Ejc5UasrVwg8mjiyOYE=; 
	b=R3CHe5lhgImWAE+7kWsSbrnKqV2ANZo8D+uz9YPst99DeSnRJyld5oeFYIDkOX8mvtucABGX1WaCzbdoi1cNpAh6LdiODIGZEl2bMuC3bY8tnVPMG8nOdNrGfmdQK5BONUunQAnpVYUl/di4gdX3pYE9gomVEX1FpLKpU1atGZI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787424778;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Z71ZUpT6ZJIEHaxndlECyET5Ejc5UasrVwg8mjiyOYE=;
	b=HQ4YLwSyQ1xoC6bfKTW+w+7l3y0lDiblNeT1fYMFTyJzciikIkXUhtcUnV4P106Q
	NN7IivQe4TZ6zSFpQK99+KOZurBVWLWw8bSOe+pYtY4J7b9QiER/kt4hdDOJbRWnTKg
	xwOWtKWNf8IC+K5HPwfnBS9gVd1TXxPnLI0ZKD88pw/5R4UYk2rqmhAFFdaY+dmHmVZ
	+TykmY6VdHqk3Gg31R+47pushnL1+DIOs8MuIfb7PxveUuCH6TdSnKGjJ7Sm4dOHAJs
	FFx1GXJttFZjTkF5VzARrO1N9HS5dmk+cfY5HMm7Vn6+lWEPRcN54/sXAtJLUQfvXPk
	nyzyq42flg==
Received: by mx.zohomail.com with SMTPS id 17874247761771009.1466001832524;
	Sat, 22 Aug 2026 11:52:56 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 23 Aug 2026 02:52:28 +0800
Subject: [PATCH 1/4] ALSA: doc: usb-audio: Add doc for
 QUIRK_FLAG_ALWAYS_SET_RATE
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-uac-demote-sticky-check-v1-1-a8cbe572edff@rong.moe>
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

QUIRK_FLAG_ALWAYS_SET_RATE was introduced into usb-audio before without
appropriate documentation, so add it.

There is an odd colon in its comments, so remove it too.

As this is often forgotten, also add a reminder to the end of the
enumeration.

Fixes: 786f91da8535 ("ALSA: usb-audio: add QUIRK_FLAG_ALWAYS_SET_RATE for Mackie DLZ Creator XS")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/sound/alsa-configuration.rst | 5 +++++
 sound/usb/usbaudio.h                       | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index b2171472e6cb..71733e807a7c 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2406,6 +2406,11 @@ quirk_flags
           works around it by enforcing the fixed max URBs (12) instead of
           the dynamic calculation from the buffer size, and passing the
           `URB_ISO_ASAP` URB flag.
+        * bit 32: ``always_set_rate``
+          Issue SET_CUR for the sample rate even when the clock already reports
+          the requested rate.  A device advertising a single rate is otherwise
+          never sent the request at all, and some require it before streaming
+          will start.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index c49709d7ad25..abc2d7e579de 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -260,7 +260,7 @@ extern bool snd_usb_skip_validation;
  *  to insufficient buffer depth combined with xHCI scheduling variability.
  *  The larger buffer (MAX_URBS = 12, ~64ms) absorbs system scheduling
  *  jitter during boot, while URB_ISO_ASAP ensures consistent xHCI scheduling.
- * QUIRK_FLAG_ALWAYS_SET_RATE:
+ * QUIRK_FLAG_ALWAYS_SET_RATE
  *  Issue SET_CUR for the sample rate even when the clock already reports the
  *  requested rate.  A device advertising a single rate is otherwise never sent
  *  the request at all, and some require it before streaming will start.
@@ -300,7 +300,7 @@ enum {
 	QUIRK_TYPE_MIXER_GET_CUR_BROKEN		= 30,
 	QUIRK_TYPE_PLAYBACK_URB_FIXUP		= 31,
 	QUIRK_TYPE_ALWAYS_SET_RATE		= 32,
-/* Please also edit snd_usb_audio_quirk_flag_names */
+/* Please also edit snd_usb_audio_quirk_flag_names and alsa-configuration.rst */
 };
 
 #define QUIRK_FLAG(x)	BIT_U64(QUIRK_TYPE_ ## x)

-- 
2.55.0

