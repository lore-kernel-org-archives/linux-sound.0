Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C273F1AC9;
	Fri, 26 Jun 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782488872; cv=pass; b=oKBRN8tOTJLRvSQdZ672XnFBzOTQgvAdcpwMbpW42iffkdjb5vqPWHZNFbH5PA+XlMEPiS6TGrsHZoSZrNMDjMdw2jbZ69fkgMk2Uwmr1iKmNqTOuDIDuvb28vxf3lBlG4H5EfoArZLyBlwxyKVOOfu3HVLUSHMxBo5TbALSdL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782488872; c=relaxed/simple;
	bh=juEO04f7mz/Xn9KaAhAynncu3Boam4pl9NzIIN+xwrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DoUtVkWS4MdpgVDUskeThO+R7+kjLyQ8HPE6hwoLsmgCVIcXIVTQmW2LXU7hgh44VxM5/VeU7HQaGMUCTwr1cz6eHDK/Rl/3Rx/ian30MF2rjB84W0FK8InIIIHs7EHOBV/KWhx55INXWvIJN1wHNE0HAqqL+/w7SUifhm4IzhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=YYLdeQQq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="YYLdeQQq"
ARC-Seal: i=1; a=rsa-sha256; t=1782488859; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LkKMvbjOEl4j/LU1lzl0FbQYAzGDDdOeNd9AMdNET9fAJ88H7H10KQ0rWglfgoLRG8VhB0NGXLp47BF1q2ChJ8oz8m918c/Zz0rwAlFOjSh7LLQqFFIL9XSCUUEYTEKXCtEKDpw1Wwu4S3xidKdTCC7Vqbj63C0FcN+y5rkOR0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782488859; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NeoSU2F+v5GS27ePgUO8U6jDZ2UQkgaPTcU+VUtiljE=; 
	b=luWFnfFosjREmCIpupoxNNL/BgHDtTBpDuLvaoetVEBxjkvg+S2f8mpzCkjcrIlIoANywY3jM2K2gAZuaW6YEa1sJMe7sm/SFl7pktQiBDY3fHg5dM1SrQWb1UQoQwLJuL+wnRr2O8vMcbsc8Yzz1vjeQqSPFoXAiNwTw6ptfV8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782488859;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=NeoSU2F+v5GS27ePgUO8U6jDZ2UQkgaPTcU+VUtiljE=;
	b=YYLdeQQq6wXct3xVt1Oeg3qgHO1X769LzmxYCxGWEicTLwZXNqyGJZIZklTt/Ec8
	skhncSqTRFyxup66+ChQrDW5U6LEKa9IU/xR3bzrg/mmvKQlnLAM8pd+gREPl2Hkfh6
	rz8bGfSf9HKfufwdpunSXzwABJQJn7XDJWn93B2Y=
Received: by mx.zohomail.com with SMTPS id 1782488857784585.15466243059;
	Fri, 26 Jun 2026 08:47:37 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 26 Jun 2026 11:47:22 -0400
Subject: [PATCH] ALSA: hda: Force resume if acomp notified during system
 suspend
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260626-hda-force-resume-eld-notify-v1-1-a92cb01393e0@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAmfPmoC/x3MQQqDMBAF0KvIrDugsYzYq0gX1vzUAZvIpBWLe
 PeGLt/mHZRhiky36iDDpllTLGguFU3zGJ9g9cXkaie1OOHZjxySTWBD/rzAWDzH9Nbw5aa9dmg
 fvUgXqAyrIej+34f7ef4ARcg9ZW0AAAA=
X-Change-ID: 20260626-hda-force-resume-eld-notify-1347e3b9667f
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External

Currently if an HDMI cable is connected while the system is suspended,
the HDMI audio jack status stays off after resume.

This is due to the jack state not being synced by the HDA HDMI codec
device's runtime resume, as that never happens if the device was runtime
suspended before the system suspended, or by the acomp notification
triggered from the DRM side if that happens before the HDA HDMI codec
device has resumed.

To fix this, if snd_hda_hdmi_acomp_pin_eld_notify() gets called before
the HDA HDMI codec device has resumed, mark it to be forcefully runtime
resumed at the next PM complete time.

Do this using a separate acomp_requested_resume flag that can be
temporarily set without overwriting forced_resume for drivers that
always want to force resume.

Assisted-by: Copilot:claude-sonnet-4.6
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 include/sound/hda_codec.h    | 1 +
 sound/hda/codecs/hdmi/hdmi.c | 4 +++-
 sound/hda/common/codec.c     | 5 ++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 17945ab5e6e2..c05b6d44c491 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -256,6 +256,7 @@ struct hda_codec {
 	unsigned int link_down_at_suspend:1; /* link down at runtime suspend */
 	unsigned int relaxed_resume:1;	/* don't resume forcibly for jack */
 	unsigned int forced_resume:1; /* forced resume for jack */
+	unsigned int acomp_requested_resume:1; /* resume requested by acomp */
 	unsigned int no_stream_clean_at_suspend:1; /* do not clean streams at suspend */
 	unsigned int ctl_dev_id:1; /* old control element id build behaviour */
 	unsigned int eld_jack_detect:1;	/* Machine jack-detection by ELD */
diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
index 1f4d646724ed..0b6816018a42 100644
--- a/sound/hda/codecs/hdmi/hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -2233,8 +2233,10 @@ void snd_hda_hdmi_acomp_pin_eld_notify(void *audio_ptr, int port, int dev_id)
 	/* skip notification during system suspend (but not in runtime PM);
 	 * the state will be updated at resume
 	 */
-	if (codec->core.dev.power.power_state.event == PM_EVENT_SUSPEND)
+	if (codec->core.dev.power.power_state.event == PM_EVENT_SUSPEND) {
+		codec->acomp_requested_resume = 1;
 		return;
+	}
 
 	snd_hda_hdmi_check_presence_and_report(codec, pin_nid, dev_id);
 }
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index ef533770179b..b9ded149ea11 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2967,8 +2967,11 @@ static void hda_codec_pm_complete(struct device *dev)
 		dev->power.power_state = PMSG_RESUME;
 
 	if (pm_runtime_suspended(dev) && (codec->jackpoll_interval ||
-	    hda_codec_need_resume(codec) || codec->forced_resume))
+	    hda_codec_need_resume(codec) || codec->forced_resume ||
+	    codec->acomp_requested_resume)) {
+		codec->acomp_requested_resume = 0;
 		pm_request_resume(dev);
+	}
 }
 
 static int hda_codec_pm_suspend(struct device *dev)

---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260626-hda-force-resume-eld-notify-1347e3b9667f

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

