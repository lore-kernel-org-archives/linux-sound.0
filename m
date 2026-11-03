Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718269;
	b=F+HMEMmpjDScmn92q5LDddkkmqfRVBJhdIKBRizWFoK2E0y3Jps4zlXJOXpUv9R7Ug/3
	 vtxqdj0aQqLns5rALriEGOyum3Cju4B92o9LEmfyOEByUA6aOlDPXkzkHNSbE+df1zl6F
	 RMKkzP9dU0YAnT+EbNuT0bhC6DidrYwl0qltuB+et5ezZJtlJkDqKXxbGttfnR/Ejpnsr
	 PMQNsP7e8nbTC48wZCOrwVLQWvX832mQC7vLwLGn9Ji/D6QbxPRcv3ZJ30fcmowb50RXt
	 GaNWoc2USUvrClZiDl/QdNmR6VGrqXMtQevGvLApzjfRYB5BeKKyySwbrDU06k/Ba2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718269;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BH0imWme+TMyg8qza96jTJW3ELiMkC4Rzc4h5VKPEDo=;
	b=qDuq/nLRoE3p+Kq8aAvSZj7Jw+OblN1Uzc8A0zSVJvTJuRW9Wc1ZJPcVaWpykVIpqqqk
	 qTeCgT/oQ/gswx5MkcRFQTexN9rfr08UmWnvsC43b7tBbDlCzQkhcLTyANwUlxsxae2td
	 JoFV2k9KunEp35ItAQKEC3xyxw2eNjtAA35fBq/drg8S3eXe7SPubbYA12EBmrarzWLTM
	 kL+Kwts4IKMf1JcFx6/zn7oSGUpn5lXWEvD+ya3MpxHJKTRQxw5+uesJ7aG3W7qYoMIJ+
	 mPL+eMQcHlNCDKMZ1an68GedOoUN+ndxCw0dZabOaY84oR1WRrUZRp4TpVRC8/77scw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=httpd.dev;
	spf=pass smtp.mailfrom=httpd.dev;
	dkim=pass header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=jfksPK8o;
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC76606B257
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 15:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC76606B257
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=httpd.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=jfksPK8o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=httpd.dev;
	s=protonmail3; t=1793718265; x=1793977465;
	bh=BH0imWme+TMyg8qza96jTJW3ELiMkC4Rzc4h5VKPEDo=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jfksPK8os/z6Wp1xu8XFH6LvhimOw6/ZxDi4GuJt8fjsLqI6qVq8kUv5o74/nog8U
	 60oPm5/rK1y+YhHzvAfiJH76THX4xR/fwP/mtVZq12EAnDn4gyTL+MBWOiaoqUuoDW
	 PMqNNx0jvsRG0v0wIUvsDS6jF3vZGfbeeQgd1lZXrvqqCaakzUqgJg/5q2AtRtblcg
	 s+F/mzJVsTkuJxOoZkpe/BOeHk/FfgMK+1qEoyLUFBgym2ExGvilEkNlPexafe1zkr
	 EhmE4elLpMkP81lnh2R81e9eJfh3D89DDWyTiB2AnKAgbNWi9kEvrrG+pNt+LgIRHR
	 65BsBh5ULWIFg==
X-Pm-Submission-Id: 4jJsKy34JJz2SchG
From: Angel J <iamanaws@httpd.dev>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	Angel J <iamanaws@httpd.dev>
Subject: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
Date: Tue,  3 Nov 2026 07:03:36 -0800
Message-ID: <20261103150336.507675-1-iamanaws@httpd.dev>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell XPS 8940 (1028:09c5) has an ALC3861 codec (0x10ec0899).
Its BIOS marks the headset microphone pin at NID 0x19 as disconnected
(0x411111f0). With no external microphone input in the pin configuration,
the generic parser creates a shared headphone/mic input on NID 0x1b
instead. Headphone playback works, but the headset microphone is silent.

Override NID 0x19 as a front microphone without independent presence
detection. This gives the generic parser the dedicated microphone
input and preserves NID 0x1b for simultaneous headphone playback.

I encountered this issue on my XPS 8940. Similar symptoms were also
reported by a user on Ubuntu:
https://bugs.launchpad.net/bugs/1971232

Cc: stable@vger.kernel.org
Assisted-by: Codex (GPT-6.1 Sol)
Signed-off-by: Angel J <iamanaws@httpd.dev>
---

Notes:
    Build-tested alc882.o with x86_64 defconfig, GCC 16.2.0 and W=1
    without warnings. The patch also applies to upstream v6.18.

    Boot-tested on a Dell XPS 8940 running Linux 6.18.58.
    Microphone capture and headphone playback work simultaneously.

 sound/hda/codecs/realtek/alc882.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/realtek/alc882.c
index 800c3d6f5..cf8d3c48e 100644
--- a/sound/hda/codecs/realtek/alc882.c
+++ b/sound/hda/codecs/realtek/alc882.c
@@ -50,6 +50,7 @@ enum {
 	ALC889_FIXUP_MP41_VREF,
 	ALC882_FIXUP_INV_DMIC,
 	ALC882_FIXUP_NO_PRIMARY_HP,
+	ALC898_FIXUP_DELL_XPS8940_MIC,
 	ALC887_FIXUP_ASUS_BASS,
 	ALC887_FIXUP_BASS_CHMAP,
 	ALC1220_FIXUP_GB_DUAL_CODECS,
@@ -507,6 +508,13 @@ static const struct hda_fixup alc882_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc882_fixup_no_primary_hp,
 	},
+	[ALC898_FIXUP_DELL_XPS8940_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x02a19130 }, /* headset mic, no separate jack detect */
+			{}
+		},
+	},
 	[ALC887_FIXUP_ASUS_BASS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -610,6 +618,8 @@ static const struct hda_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x0259, "Acer Aspire 5935", ALC889_FIXUP_DAC_ROUTE),
 	SND_PCI_QUIRK(0x1025, 0x026b, "Acer Aspire 8940G", ALC882_FIXUP_ACER_ASPIRE_8930G),
 	SND_PCI_QUIRK(0x1025, 0x0296, "Acer Aspire 7736z", ALC882_FIXUP_ACER_ASPIRE_7736),
+	SND_PCI_QUIRK(0x1028, 0x09c5, "Dell XPS 8940",
+		      ALC898_FIXUP_DELL_XPS8940_MIC),
 	SND_PCI_QUIRK(0x1043, 0x13c2, "Asus A7M", ALC882_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x1043, 0x1873, "ASUS W90V", ALC882_FIXUP_ASUS_W90V),
 	SND_PCI_QUIRK(0x1043, 0x1971, "Asus W2JC", ALC882_FIXUP_ASUS_W2JC),

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
