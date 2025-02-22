Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64982063C8
	for <linux-sound@vger.kernel.org>; Sat, 22 Feb 2025 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740220197; cv=none; b=JsdrjkDCCzSmR4W5PPk2sZtjspwtP45PRMa0DVWEASvEg3TT1CNTYQwiW/7LK6XWWK2MPEfBC13eZzzuxFRPtgXE1uwD3IBFp3veXZODQvJM47uEH67jEA8SvbJhucLKWoWz5fE/ijQa2yn3ebs/qhgOsRSQxbOtY+RdLwMRKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740220197; c=relaxed/simple;
	bh=/4T9U5dhgq0zIDkCGY4oZiEC4ABDJ1IAEPQ4XEc02Z0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dmR/difH24VgEwn/iDhpPS7Ai19eaDchalDcTmq7IGSRLjpTqTI6fB8N6cBJ0XQFOpfPO8mg3OT8P1apTYP3AfiR0J0lvPujhSdhPLQ8eelCmZQrrVl/Vn73+fZDbImzjpEBA+49NsW9A/ZBJgOK92MqOFTZrb9pqBOQrsME9uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=QJuogXv3; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QJuogXv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1740220174; x=1740824974; i=wahrenst@gmx.net;
	bh=RVF+waKK5ZBI1JS3kddeE8jXPtiMFH4dzYwp19EAyb8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QJuogXv3iqfxnRBQgvmFgvM6l5rGRgTJycaFshuA2SYpjXcUo2jrCCTKGABJQV0B
	 yX6ctWeFSZGW4qXjMEXs7exHCBnYr6e5wRFvCsd8HLlVJJOYi7SJ+tyWltoX+46no
	 Hazf3Owl301SRCLSoWcEgXPiqUgK9qRVKFguVU7yYq4B4BH98eaQDkFFqx0Vp5O5t
	 Wz3WHyVSO5JqB1zFKivxulPB6gzWY69wZ2F6dvxfPzeXJoHsdj/whbSAJdMyRZ+Cs
	 dORxzhP7O4Ta3KDofF6ni71hr7sxzQeJ50ThITdCnC7E0iU6gR3eqf2hj51ZSmWce
	 /d+Kgu0hSqF9NH6ZUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp5a-1tp8q22uqK-00Stsi; Sat, 22
 Feb 2025 11:29:34 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	kernel-list@raspberrypi.com,
	linux-sound@vger.kernel.org,
	David Turner <david.turner@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC] drm/vc4: hdmi: Add jack detection to HDMI audio driver
Date: Sat, 22 Feb 2025 11:29:21 +0100
Message-Id: <20250222102921.75496-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gapLJoOGDRGX1NZ2CoyUGA3VVYaDHoroP8hRvYOm7gbv0Vtv7lI
 uNtyouTviXbwrB2oOz0K/4x/4onRyVPDYgjqxefWWFtfHKgIW4k+YKvEX0cJ/mCz1mVi2Pl
 qbGn3yOtGMFlQHvly7ADF4drTmeW+l/+A4HPfYnlifeMHSR0GDs7FbJqz0WtOQOOaWJVmKB
 m4JarOO4pjVjQ2py65iHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t0Nv7QICJJI=;2YDOopp0CjdueF5YNRMgRjAD6Mn
 OUaWrQ2XKlHRbzKnQD1WPvqi5GsenDNbWzXsn0Ag8wcljlft6KpfoEZ8LJaVGStBZbvltR3y5
 KbafBj1/65dZCdtrivlmMP2PGxdtD5Qj8zFAsnWHokhkFq80rQkyd7kxJIWK3TRwK4HmlmWqW
 9hCgMIPkslVAGlfWtIz5JXwruEVDfY2If92mVfcbGPZVnk4NqWhAh5yFGTKJ6coEBNPCf/msK
 ZoQROELkjn7SwkDFm76MSAV0xBHOcQ0EX24amgItzY/C/ZtbZKdAw7wv5C6PopJ2FpkSXvA76
 FXzoB/Dhc5fferHxhe8KkTZP5tB1grKo0nFxJLxmblkfBBxIbdL7p8mACW5F9B01Nxt4SKVeA
 w3GyGenpXGuJcWOYxA6Dy+i944YBDujBzh5c4og8potp5toCsHDmzSWRImJhmTUqpeiVbuOjB
 NWb7az4EVauyUhZbwhUgCRX8+jLJPz169vSogK7dfCrqOO5HCUGw2CeGGSI2WlydfHoqv7TbA
 lat4nQg1IuOq15c+SDpCBpVQcznx4oNzjfBz96vp8tHSNOZ7PQGW4BCi/eiOSPNfP7I5Yp23A
 /kHvKIyfT+Y3EhBYmnCJ7aIemmRF5bk+fnjksKcqHGH2UT2x8ZsproqX/DhRqx1l3zonBJhM/
 yn6YdzxbCro0K+Z+GAOZqaGxUHiu5a8z61Db6BDK0tSZDIXiliSxLfDVY5H0rMhTMGwB+Ldj8
 51teCzYWe8eTsqghNz5rRnjMi4BrQvqqE+0TKHB14WkBz1iIhUcM6dxI3bU+RfsUbbOlwvUDh
 Vs2fJD2AfAyi5gp3YRb/UYu4ijT3L+wUFKCr3KouzPFUejlICp0kKrJQXWf8KMVJxIZY0MJFZ
 PXSat+cldiX/eqjKieNIfZwBKBzE1omCh8zGep6jhvJGRql+4xK3YAEMUPt5nSocHlN4lJ8lP
 A5hNY0YcTNzuzckyn3opsqfCGx4nGOQ6gYir836A6ZfjMcKLzqbtO7WFdQAcY4muSUbeitYZ1
 UDUcXe8NV0LWDDHEpuApRGLh1ySnHnIQvCnOTMmfxnz0oQIiU3Ilev/sgq+JOvqLu7juPSV3q
 VqxLNZwD6erZrKINkdeV/SoAJI5ZH9sOa91KxuDEdP2fN6A4mFgvSHDyxXt9ldOXULR5mKKex
 qaU5H88a6YnXDiuEewUdBiTVH0KM5tkD/S0Kj1K3nOY//r80s23ImNBg8z1DFuqx2PfBFufNY
 ihaGc9VUgl1JzKOK7KUNIgbhNQiWcHT4bAwpOvBLpcME3W2nQnINQjJmNaBjQsHu4iT70beG/
 CEdeDikQbj4kb3C2gPO2FZ3hP8LzUwHYHXHOAi/qpedtp1cas3QlcC3Vukt+NlBlPBadC7nvA
 egB6VlE0aHHUiOYrtIjRz8Z9mU5xmyxXydh/Qwk4noHNlt9sBYuRGHH3+Uhq1yYTebDDpsveH
 Aehfs7Q==

From: David Turner <david.turner@raspberrypi.com>

Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
when to add/remove HDMI audio devices.

Signed-off-by: David Turner <david.turner@raspberrypi.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi=
.c
index 47d9ada98430..d24ae86d799e 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -51,6 +51,7 @@
 #include <linux/reset.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/hdmi-codec.h>
+#include <sound/jack.h>
 #include <sound/pcm_drm_eld.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -386,6 +387,12 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *=
vc4_hdmi,
 	struct drm_connector *connector =3D &vc4_hdmi->connector;
 	int ret;

+	/*
+	 * Needs to be called for both connects and disconnects for HDMI
+	 * audio hotplug to work correctly.
+	 */
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 	/*
 	 * NOTE: This function should really be called with vc4_hdmi->mutex
 	 * held, but doing so results in reentrancy issues since
@@ -405,8 +412,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *v=
c4_hdmi,
 		return;
 	}

-	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
-
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);

@@ -2203,6 +2208,22 @@ static const struct drm_connector_hdmi_audio_funcs =
vc4_hdmi_audio_funcs =3D {
 	.shutdown =3D vc4_hdmi_audio_shutdown,
 };

+static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct vc4_hdmi *vc4_hdmi =3D snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component =3D snd_soc_rtd_to_codec(rtd, 0)->co=
mponent;
+	int ret;
+
+	ret =3D snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &vc4_hdmi->hdmi_jack);
+	if (ret) {
+		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL)=
;
+}
+
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =3D
@@ -2316,6 +2337,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_=
hdmi)
 	dai_link->cpus->dai_name =3D dev_name(dev);
 	dai_link->codecs->name =3D dev_name(&vc4_hdmi->connector.hdmi_audio.code=
c_pdev->dev);
 	dai_link->platforms->name =3D dev_name(dev);
+	dai_link->init =3D vc4_hdmi_codec_init;

 	card->dai_link =3D dai_link;
 	card->num_links =3D 1;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi=
.h
index e3d989ca302b..a31157c99bee 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -4,6 +4,7 @@
 #include <drm/drm_connector.h>
 #include <media/cec.h>
 #include <sound/dmaengine_pcm.h>
+#include <sound/hdmi-codec.h>
 #include <sound/soc.h>

 #include "vc4_drv.h"
@@ -211,6 +212,12 @@ struct vc4_hdmi {
 	 * KMS hooks. Protected by @mutex.
 	 */
 	enum hdmi_colorspace output_format;
+
+	/**
+	 * @hdmi_jack: Represents the connection state of the HDMI plug, for
+	 * ALSA jack detection.
+	 */
+	struct snd_soc_jack hdmi_jack;
 };

 #define connector_to_vc4_hdmi(_connector)				\
=2D-
2.34.1

