Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0251008
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="gAtpDUno"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 42A80604B18D; Wed, 27 Dec 2023 04:38:38 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 42A80604B18D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703614118; bh=BgaJ32GMB6RjoC46opjTtx1YNOtIScEK+d2ov2yAQbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAtpDUnolFLTEOP+uCRjzXyRlloigpHpMSBCe6nUW8wk1EcpQhnnzan7okONEWkHH
	 hr00vEx6vh26kSPSG1bO146z4aCjUDFNmWZMBFAi/QaQqt3OgBl4iS0NS3obuB3kLd
	 5o0GOnOKsGLxUmt4LKD61g32QKoynVV3TQy2zWcFygTjzrHJZzMwyMVbN6QLg1ZQwF
	 eLTNs0LELQGOwQxrPpVtcB8o3NGlj7fk5XEQBi0h7iNp9nS37HR6MEENT08yvkiRp/
	 DbE9L9TRMnciJ4kqtnR9DGGmGAB7JhuxziAEOf0MnRKhahea1SfyGPQNSg9v2XSQCK
	 aY/jcPNpPXN8g==
Date: Wed, 27 Dec 2023 04:38:38 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 16/20] ALSA: scarlett2: Rename DSP mux channels
Message-ID: <2d91d0a74d5c7f6179e950bed2c80a4498d16649.1703612638.git.g@b4.vu>
References: <cover.1703612638.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703612638.git.g@b4.vu>

The DSP mux channels are of type SCARLETT2_PORT_TYPE_MIX so the
ALSA controls would refer to them "Mix X" and "Mixer Input X". This
patch fixes them to be called "DSP X" and "DSP Input X".

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 5ac31fea9831..5c44793fe345 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -583,6 +583,8 @@ struct scarlett2_port {
 	const char * const src_descr;
 	int src_num_offset;
 	const char * const dst_descr;
+	const char * const dsp_src_descr;
+	const char * const dsp_dst_descr;
 };
 
 static const struct scarlett2_port scarlett2_ports[SCARLETT2_PORT_TYPE_COUNT] = {
@@ -612,7 +614,9 @@ static const struct scarlett2_port scarlett2_ports[SCARLETT2_PORT_TYPE_COUNT] =
 		.id = 0x300,
 		.src_descr = "Mix %c",
 		.src_num_offset = 'A',
-		.dst_descr = "Mixer Input %02d Capture"
+		.dst_descr = "Mixer Input %02d Capture",
+		.dsp_src_descr = "DSP %d",
+		.dsp_dst_descr = "DSP Input %d Capture"
 	},
 	[SCARLETT2_PORT_TYPE_PCM] = {
 		.id = 0x600,
@@ -5378,8 +5382,16 @@ static int scarlett2_mux_src_enum_ctl_info(struct snd_kcontrol *kctl,
 			const struct scarlett2_port *port =
 				&scarlett2_ports[port_type];
 
-			sprintf(uinfo->value.enumerated.name,
-				port->src_descr, item + port->src_num_offset);
+			if (port_type == SCARLETT2_PORT_TYPE_MIX &&
+			    item >= private->num_mix_out)
+				sprintf(uinfo->value.enumerated.name,
+					port->dsp_src_descr,
+					item - private->num_mix_out + 1);
+			else
+				sprintf(uinfo->value.enumerated.name,
+					port->src_descr,
+					item + port->src_num_offset);
+
 			return 0;
 		}
 		item -= port_count[port_type][SCARLETT2_PORT_IN];
@@ -5472,10 +5484,18 @@ static int scarlett2_add_mux_enums(struct usb_mixer_interface *mixer)
 		     channel++, i++) {
 			int err;
 			char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-			const char *const descr =
-				scarlett2_ports[port_type].dst_descr;
+			int channel_num = channel + 1;
+			const struct scarlett2_port *port =
+				&scarlett2_ports[port_type];
+			const char *descr = port->dst_descr;
 
-			snprintf(s, sizeof(s) - 5, descr, channel + 1);
+			if (port_type == SCARLETT2_PORT_TYPE_MIX &&
+			    channel >= private->num_mix_in) {
+				channel_num -= private->num_mix_in;
+				descr = port->dsp_dst_descr;
+			}
+
+			snprintf(s, sizeof(s) - 5, descr, channel_num);
 			strcat(s, " Enum");
 
 			err = scarlett2_add_new_ctl(mixer,
-- 
2.43.0

