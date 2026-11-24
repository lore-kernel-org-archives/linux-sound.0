Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.69.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526767;
	b=ga6MCgfRIKZi29m/Adv4+a0kjXDss01A9oZqkKa9rb2jJ3tMFE5Fa78mbZe4lM6op6Oy
	 cvt0Sjn4FRxbeKV3NexsDjAqa0/uvmdijD7sCHAZNR4fjoTNaKsPiSh1ZB4KEUK/ze7jf
	 2OPmd8xWNrbUr71uI3/1Qdk0V2wh15E4EnEvKXaSek21jEKOkw/MdKgYhyQ/YM6PbGq8y
	 LIFdnipQLwHcw310cyMtKazG5aQ+0ZhoSksxXiLEa4aSi5YUK8LbG07QTvGFqKrRTbzFS
	 AjvFaCsWHKNl6/myFLLX+nrxMcqnltCkrLzTlcbtNrcOrJHLpHDeF5C2ySXxryF1dlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526767;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Info-Out:X-JNJ;
	bh=aTGI4lLV0t2w0lf9OaFh4hg5rE6X0XqhYUDuNYFeVog=;
	b=Ak4H5ZTGdSVcnMF2aQPnzxzi2IALgypEInSSvq2cYZW3OoyzTQf19zWgW8nPomFyNCj7
	 +Ctl/xfWneP9Lr6eXTczaCbrWtOYdOJOAVNQQZT+HtwV1S19mBvDMXuYK8Pzv1xcOIBfZ
	 Cf3pMd7omdKlmCst4s9uoewDUrs/hyydN7uVn/9/tKsw0iPV+MWyXIkuU9A6WduRokvNM
	 QwYGEk8837Qg5hMVcWHDGHxMNpkRLv6kqK7IdTDqA3L2zX2SqOunw2REqM3voQiYR2TIM
	 Td3inLirvWwvYZXNL3TveBK5TtXYtM5xGp6Ep8Ko1bcDprv7Hsq5bSyVGEUStpVpK/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ynnk.dev;
	spf=pass smtp.mailfrom=ynnk.dev;
	dkim=pass header.d=ynnk.dev header.i=@ynnk.dev header.a=rsa-sha256 header.s=sig1 header.b=VAKqKE7T;
	arc=none smtp.remote-ip=57.103.69.201
Received: from outbound.mr.icloud.com (mr-2004a-snip4-11.eps.apple.com [57.103.69.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05713606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05713606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ynnk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ynnk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ynnk.dev header.i=@ynnk.dev header.a=rsa-sha256 header.s=sig1 header.b=VAKqKE7T
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id EF1161802B7C;
	Tue, 24 Nov 2026 13:26:05 +0000 (UTC)
X-ICL-RepId: 01a20dbc-2d65-74a9-9a8f-a10cb69193af
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynnk.dev; s=sig1; t=1795526766; x=1827062766; bh=aTGI4lLV0t2w0lf9OaFh4hg5rE6X0XqhYUDuNYFeVog=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=VAKqKE7TPaMlGwTfCF2NQhL+8SespFSv7pTow26MqOAxKnYlUaaWQ4hRXGrc+pLcOe1GTgZMN42yYci6s29vVNSKonMrEPBmGTogIs2iWgw9NCqAoaikcqeGGoBPInxgW5a5d50fX5JM3AmPtJOTHr0arFJ5ppJctKBPrV7lP1PFYVTNCgMivraa121pZmwhYDWzOnUBajt55Zc4wo9kExgwoPxypWjy1Cdbm19Nw+1kEyWveLwYBViDS8seqFvDRrls1V32VvdnZi53N47PnksqS5TPPyOo6s/klS6AIUsMcCI3F0BzWsuBAADHFQK9FOZO+1LCHTg1/DiRAKYVqQ==
mail-alias-created-date: 1686161252489
Received: from notyourlaptop.clients.bit.guest.onway.cloud (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id 5FD5F18001A2;
	Tue, 24 Nov 2026 13:26:04 +0000 (UTC)
From: =?UTF-8?q?Yannick=20M=C3=BCller?= <mail@ynnk.dev>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	=?UTF-8?q?Yannick=20M=C3=BCller?= <mail@ynnk.dev>
Subject: [PATCH 2/2] ALSA: usb-audio: Limit the unit nesting depth in the mixer parser
Date: Tue, 24 Nov 2026 14:25:51 +0100
Message-ID: <20261124132551.137134-3-mail@ynnk.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124132551.137134-1-mail@ynnk.dev>
References: <20261124132551.137134-1-mail@ynnk.dev>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RldsJDGfys3qzNj6Jvrbm2_Lvmf-1mQ0
X-Proofpoint-GUID: RldsJDGfys3qzNj6Jvrbm2_Lvmf-1mQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX7zZMoRImpBSW
 DZhc93F9+AvsQGnxmmvQRMYhV4VONSzq/FJXCCcfHQV+nBsq3c9s7hUcutmwjev7aogCGUlpEaz
 9A79FxZtRqwBkvQtbPKTe4GJyOJOGzPeBTc6jF5lgw+8LTlZkTYpfJnjThF30fFI3A6jsdDahWt
 USzpo+sZaKx1E0MZ2bmNtaiwV9Mfs2d9PbfqgCAuP1VXHUGe4a6njWvOYyPFiB6npg0yIaBfIM7
 xdNKM2B/tdS/cVRbbWI+ZZ5qGflbmzzIERxV8uOUs/Oagdp30yawAacHDwrZNXEoIQBWtdGZ3cR
 gIDwKmsJVs73FYbEwVqFdLu65Nn/oNSEkWq+PrvnSbBr9T1zCDV44bekG10WH4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX3X6MSzar1fip
 mhIpDWKPIflckcTiO3v4HggXEhvL2UF8nKwBYu2jIesSkH1uxDGKgQzu4gtp5/3xPMZMS4m1/J5
 WmAFyRFKFhqOxhYemnKvlPGh8JmHDG0=
X-Authority-Info-Out: v=2.4 cv=VMBIDNPX c=1 sm=1 tr=0 ts=6b05906e
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=wbbCu9YnSpm8ZdSLOl1R:22
 a=RwuFXZ2R_MmAvR3-S1nW:22 a=R3KJ1VCNIp_4E-SdN2wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABbkjG2M10pLFYtdr3vjB7w4ioG6Vrl2S/OH43hv401dPBUT9fRG6RyQfR0xGFCO
 vPt5fVbw9dw+K1orbG/XbsIbz+F+rfiQUCr9C3LvpNeVtrJZEuOayig0z+donsFGeDBEiZ
 rCTjqMf7stgSKqSd8oWc1mypuoIImcqvvrnpqw6rB1TtHun5GvhnAXGzU0ijRP/hdg7Nvc
 YEvqkqbGaf9tkjOb7rKlfc7OPUNvb2grTR3+QZXj+zQtSVwkHJCFp+VbjEZgYmCWoAupdZ
 tX4Hvp/82GoPbhGn7KZznKBPgtCM0MDrSCP7v6spMI7qTzR7B2luMeewTsYeyiG913ppTh
 ch4NR1WZQXFFAy9REIDA7bC3ip6Cbfsw9dOStxdg7ZatwBz/uNhQU54F1TcEDhIMmLDfLo
 P15x5bLGBlT62aPkZCcOvfGOVZqED+6bGQX8wIpqUe3qV1O6UJ8MAobH9q1Gw6CtdNibyH
 WkSicfKZCwYdEXYC/Z7xMpNfHQFP6t2+kAN7C3dJh2A1iufLEWd0X+omaOPJbAKFmiLE5I
 k9fzrzUCFE1kgx4l0EIcwd/wVxFAXvxf8N4Op3GDCUX2/QAFExtLj7IPhdKsi+vfOs+UwY
 gbWI6UvfhycoVp23SOY+F+dv4+3jRoa3ytkNyQt8YLeN45bPo0BtKBtyXwzhDULkoeVpBF
 QTCHP/brwJ6zuMRNvPr7hAirgMlt9zAuj/Zqkc6ofAr2E/O0BGND4tf9alPfothN/KNlFZ
 QVDsA/NwM23VxtJhC9EucPzqN9U2CzydoCdjmn8N7ZeO2wCYO/8rBmFssdW5EoA/Cr1wFV

parse_audio_unit() and __check_input_term() recurse along the source
IDs found in the device's descriptors. The unit and terminal bitmaps
only ensure that no ID is visited twice, so a device can still chain
all 255 unit IDs. At 176 to 304 bytes of stack per nested unit
(x86-64, gcc 14) that takes 44 to 76 KB and overflows the 16 KB
kernel stack while the device is probed.

Stop after 16 nested units and return -EINVAL, which the callers
already treat as a broken topology: that chain gets no controls and
the rest of the mixer is still created.  The deepest topology
documented in mixer_maps.c (SB Extigy) nests 12 units.

__check_input_term() nests at most once per call, so counting its
calls since check_input_term() gives the depth.

Signed-off-by: Yannick Müller <mail@ynnk.dev>
---
 sound/usb/mixer.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 95209ec006b3..37850f34caae 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -51,6 +51,7 @@
 #include "power.h"
 
 #define MAX_ID_ELEMS	256
+#define MAX_UNIT_DEPTH	16
 
 struct usb_audio_term {
 	int id;
@@ -69,6 +70,8 @@ struct mixer_build {
 	unsigned int buflen;
 	DECLARE_BITMAP(unitbitmap, MAX_ID_ELEMS);
 	DECLARE_BITMAP(termbitmap, MAX_ID_ELEMS);
+	unsigned int unit_depth;
+	unsigned int term_depth;
 	struct usb_audio_term oterm;
 	const struct usbmix_name_map *map;
 	const struct usbmix_selector_map *selector_map;
@@ -1023,6 +1026,9 @@ static int __check_input_term(struct mixer_build *state, int id,
 	void *p1;
 	unsigned char *hdr;
 
+	if (++state->term_depth > MAX_UNIT_DEPTH)
+		return -EINVAL;
+
 	for (;;) {
 		/* a loop in the terminal chain? */
 		if (test_and_set_bit(id, state->termbitmap))
@@ -1093,6 +1099,7 @@ static int check_input_term(struct mixer_build *state, int id,
 {
 	memset(term, 0, sizeof(*term));
 	memset(state->termbitmap, 0, sizeof(state->termbitmap));
+	state->term_depth = 0;
 	return __check_input_term(state, id, term);
 }
 
@@ -3180,7 +3187,7 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
  * parse an audio unit recursively
  */
 
-static int parse_audio_unit(struct mixer_build *state, int unitid)
+static int __parse_audio_unit(struct mixer_build *state, int unitid)
 {
 	unsigned char *p1;
 	int protocol = state->mixer->protocol;
@@ -3240,6 +3247,22 @@ static int parse_audio_unit(struct mixer_build *state, int unitid)
 	}
 }
 
+static int parse_audio_unit(struct mixer_build *state, int unitid)
+{
+	int err;
+
+	if (state->unit_depth >= MAX_UNIT_DEPTH) {
+		usb_audio_err(state->chip,
+			      "unit %d: unit chain is too deep\n", unitid);
+		return -EINVAL;
+	}
+
+	state->unit_depth++;
+	err = __parse_audio_unit(state, unitid);
+	state->unit_depth--;
+	return err;
+}
+
 static void snd_usb_mixer_free(struct usb_mixer_interface *mixer)
 {
 	struct usb_mixer_elem_list *list, *next;
-- 
2.47.3

