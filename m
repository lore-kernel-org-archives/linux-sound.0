Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D633A8737;
	Sun, 24 May 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640203; cv=none; b=DQUJsQCBLUbKNZt2T2w8nTuLqOQJJSymM0j80dld4R3U7O9LPsfVyTxBbKaGV6udmZXoavqYy0jsFbEWbZMSNqau6+rDvnmFvrkWt1l4FTEuvUJVfVVWMhX6HjxAQMmPTxNw4ZohzSF3BDCPx7DH2bEvbbj1c6Bzl5z7S0Nc3BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640203; c=relaxed/simple;
	bh=Rs5KdNVHBk6uGezZx8p55bP/qBfeSjPBIhH9JxpmhJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Av8fgSkRjKHMGGGX8Ib94E5xIH2PIW9K4PWdyVtdvHGtvKSGbhUz4SW021T4+OULBfSbBKYRBOQkrfnSQKh11S+H+BnK2l9RQNPOhBk/ewlAHcMOInzH5lH/kFS0NCJucVStktPLMVf8XlCSzEjOIx0VhVR2+VjWU4TEOvclMMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b=Ss1KKpZr; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b="Ss1KKpZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1779640194; x=1780244994; i=len.bao@gmx.us;
	bh=8gVCEGGH8/y2ewgWhcKPkM+9aqjblJBBsq/b77s1z08=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ss1KKpZr+F+zDcKF+lRk4THoDlt5KuDUmRvtm8gmxsisIzItbgRRVJfEzPRWQSuw
	 JWNCWLORd+nVvM6dU6GqcQCBD/tn0mfY7XNYklbENJaWmVCeygX0PZSgVqmwnDPsd
	 +t48iGenSCXjCyDU/7DEGmxNLzRiS7HOCfdQRPzMM9t84FSW/LC0JI/xpI1wvcqtb
	 3NLb6BComVwLOOTJA0+1bluozKFb1xWXBRsaKllFmKJTthEYPZqXQWabBuF0T3d0s
	 s0SBiZ1C1V+bRHJChMMDHJ6pbdXsVNFYGWb1zl60QWGRozdH6TqiO1srJf8LGHcFa
	 Fh555fd/3n7of6uUNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MYeQr-1wmPVB0YnD-00SOdL; Sun, 24
 May 2026 18:29:54 +0200
From: Len Bao <len.bao@gmx.us>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Len Bao <len.bao@gmx.us>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: core: Mark some variables as __ro_after_init
Date: Sun, 24 May 2026 16:29:13 +0000
Message-ID: <20260524162914.47764-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U/VEAN6jQSornIgoW+eUa21Fdod+e8imJi3nconYbJEE9CDS09n
 MYptGy569SQbe0MWCt39LdizHm9MY6cKuYJsdMGiGygKwqIHOrbwbVUNvz/qrvVRrTO3Aq7
 VDomPiccXfgGPDesJutptNsMnYCoGIC0bz7dOih41kUzjPnGPrOPULqw89oaOTlUAvgXklx
 BYk5A/O15Nc62ivvB4wbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M7SW40yEkhg=;DSXJpcf4N84YPpKM/ihiqwmHGJ7
 g2GNBY0KEsHJr22lUCvelUA3r9sg/bse5LJYztRQTuLBGFBFCswUdLp4tQNOTZEuUwa4Suadz
 4wB3lphLf7bavxiSBNL0iBycxwM2/ICkD6kYPLoLWrXUhKqHdPZdxVF0YScI7WFMSid7F0hAp
 KIYZLAyvZffxT/Hm2vfGgaE7R7kHshB4SCMP0CNjG0IsUXT6d9Gu9ZQo0vmue28PbNKNP0pvl
 QNpE8shDj4acWRxpMYUPJAY6zRvUgExqna3T5pDctAeK11+cxd8vCdTDQ8CeBrf82HQ/u114f
 TfI0efR6H5mnB05+uaul3PZuKAELPlC4dGi1o0lNCH3l6yupnp7aDSlE/MUQCU3nUcKh/3OFe
 z4a1DJT6MJkeEubev8oMUMj7T1+5y4ZeYl5bzgL/ZCzwHAYlXkcinQMq77TPVOcX6xW58drv8
 mMlctLAQe/GWaAcfdIMYGcrquskpNvV+7BaJ/EvaPgF7inFoDCMtyj1kCw4RkJ6gzmnQJlnXS
 0KDhnxGNKKaY8WM9HrfLdkYsZot8AiEYhUdoMw8xcckUIkuk2MXJdWvLnPDsvK2Ir1+DM+b3O
 uKgCbcfww+MiSqZPUWkVPi1oa3ZC2seF53C6h10fkrMnRYXT5kl40MzFxEGLPWFe39jpITYRN
 h52iKT882fweNWi1Snrqogc3OpkVCNW/OlFdhjyCzVAbSou2O4y0pDtQtfWMlfhJi4Mzao4Bl
 1Ra281geOzFQ8lXAcA9YKcV4U29tBpvQKYu8qZE36UgvDs7KqbOqB8YDrsO0pDcpAGYI6pvl5
 aWT7XA5W6B3FowMnClNnCA45w/Z33/QTnGlF7DEJbCpGof9CKH9TETp8ng7P4Gnh+H3GXR5uF
 l6FTfnZxiU2oanxFk22M1JbxokXuq529+be1q4ElFcNVUsvrLTMXZ+nlAZOyRfzIMJinPyyMo
 CNtNyI8VkudLNCXimrks5fxHCRqidZiJg4OaRwD79wcOcCYZsyrl5Jt2H5SM+zFR5oRrvFrdk
 J+4EuO7Qw7bB0VWLdOv1UCKjzhOZtoGeklvAntGYGhL1+vELdZJoCjJpHPZTKVLtBi0bs6sPS
 g3pw3f5CFdivRWLdR8XZS15KIv4ClaI1dpgd/Min2DAQc7dGXd8Quc5FcjwtASep/Fe5k8dqT
 f33Mg7LkSx7nSmkhM2SZ3fS9yy0iEOcohU8RH8prqAs6ozeDr4oK76l7hAYyGf0XPLXwm8qon
 K+h3HHsR854HRdPCFy8FnT8DQX+P6Fzfllnn0+CcD4O3219+JUp+s/tpDWrAqoVrSY/WOKqKE
 Yl8bgdo9F0jGHKJ1j4HhRj/EhH56aoJXG5n+Z8HXbvQp9JU6GIa18idJ4VwBfbljMWrmPrFrn
 NCH77Agjw07ZLiQE5WcUWCMTIsa8L5HE3xDPmlpXUm3A1J+0N1Zfqi4d5SxgHERWrPRpbvQfu
 XaS+D8DACCGbwU1tpTJ0u0uE75VemOBl2EGjGW3fVS9QXUjE5UU/UJ2rj9anhRXOpP42VQyCj
 C6JTBTzOQ2GAgGTlp3fWCeDnaGvL+CaJB0jsA+bjzxVdEgeBFfZHkqTqYEcZL6KeI5QPZd53v
 unOwsSg/1KVV2OjKY2+6nlvBtoAeAhF2Yh8/o+8wE+Xf7WbSyHt95B/P5JK+QAKT3NDSnWSJU
 +VMQcYjquFJ65PL4teowdjY78fL+uLfSTMtbOT0JB/TH/4qmjFv2zj1Wn0HQWXQ0ncYAEW+q6
 m8U9YDA7Hg3+nC+vh7MIU+RkuYzWfpvWpGR9YeR58StuPEyOH1zVcNwjYvUgIWrRTwpdGzvJZ
 YI8CIm9ddjMCKpWXMXbjoNXBEJeYB7lGG+dzzg95G+ZXJJJFTMQgw3w1YD4dpLo07eJWRH3sW
 jzjPOfsodoX9sAlDier8GaxJnge5HngB9yJ7kUdg12uvjqjkidGBWS7RrTRV9fs9FxcPE9Caw
 hlOWFN9AMnNK40zS2sp8SJ1uDSkGt080Wk4TYpBV6UCJZbs8sriRIQj9EpkVtBMSaB9tSsJ67
 6ITU091Mpx7EnxMXx4B1hpvlvcdwXCvfLt03VmLta3hXuzSiUxFKDyAp6GTYRgd9YwF9883j8
 z9C2KrrAKqcGKBEo33saAvHOodqYwpZWQ+GHDRUHNNbcPi1W9oOd14NBZ9KFBJMllZnOO/p2m
 VQNL7ghFfq/PaGapu1Kq/XLrr/gs7+yIalTa3bEDKle85nUkc/ky9lZpieYHlJpIYI0bGckT8
 sClyvbfJTEY64kJaf9l/PZC3EJacIW4ZlzDCJYAGoh6gvYitg4yD2wz1mHf/hElxgkw16zMfO
 oX/j8oHhkdAu/3UkvPRZgUFLpZOu6eUklq22eDvemjPa0pNMrzvL1MNC32LcffQzuGG9selor
 958WGbwMPm+5dDrdE1NakRGo9go2F5N9lWGDD77Xgs1+cPIqo9YuN0nyEdaKbMmTXnsEbF2dX
 EFiMFDdKo4wxNWmCxDHz3WS1XVkNctKznYyUI+FGmVnh5gGxIXy5NtkFbH7ezMiOrJrWRR/KN
 Yw+PwduB45dddyAhLVPBuOjeZqij5nr9tIuF8P3IoXGJuHdZFBZaqTWUDSOHDB82xvKwILo6Q
 fIx7TY+7LN6cfAqSAbTBysTbCWPKZm7W4/wAXhDK31bVAVGh9fafCtvrqjft3oUoApnbwEvIH
 fXjH03RP29BU0NPAZECfraIUGdVswjte7WyWxRcMf0Exs1IkVKTtzaChbvBrGgvcoovg2o7Em
 ATIL8FEH//iJXx9sLkXb5zFSjZ+F2oUnXGG9zeF/xtA1Y5OqUf0zKATo+OAkUvLTvG4hclQ3r
 goyXC69s5SOgGaZP+beqolaN83Fh3twh3NkbgiNTyzj6Sx0X1CTwU7pqhyygdxyHgPfoDHN5H
 37CbVWo0qb/WXC0MD4E32nAXSshsmy/Z42QMKDBej+IY+LLMxo6q0rQNzpz9pc19S1wG95GHF
 frCoMqv5JNJPKLYXpaGBhIto2Qkczd7dOFsMxj1pdX4gXLRqv+lv7986SSNm9TlmVguXPwDP+
 RnZFlSTkgGtwTBU/b4TY4xVYND/2YbC7pmGQXhAaIEFLam09tyyLwhvFxCQeWAJn0cFbKmKHG
 gEpboNA1VZkWKbeq9qaOefFnGzcuc1a5le0ikreRz+v81znvFAwWlUBIJyIK5Ft000zpgfLNG
 AvQGJGqHv6e0ygvSRTCZXErDXM0/Ke77IULgk5PKTiCqJimbn8TEXXz0IoOfCiRVwm37LGbCL
 lFvk28hPQ5KOZzszGAR/JAH4MkpKsAey8P1LeoBmUgO4P4D03G7MjPExEtnMzFqaoepKeMlNp
 l99n6gV1hIDpYK44YDMmNGxT8oEg9F/j+w2s6yG/V2jmW32dYTNgS6x3TzwnJ3w1BL12le6MM
 uqd/CCKNtCfzIYhG025V3qpoZZeWNrodlN+NPrP7hs+UjIN8xWNQsU/dsn9VlWRWv0BHCea6f
 QoHnaEghCUcE6d9/T6UaP7YjxXLFB3fNSzHSQQdFJxbhNpDIvpwsAdSQ8k2znJdo9sYz9jX0R
 MIEwJBJzh1gAT9zd4b++6+EocveL6r43Xrk68QXBBS2JblMLNpCWovb1RsKaue8qVjBRTjlTW
 jDTygoz9QMNxbnuIA5ABDxwDmFCPryPP2/Qf8grZeIakcchqBBgiDJqogG1rNa7TxW2sgEYz9
 SgiaKRSZ5v4Fr46vvNSuE6x/P/Pluz1dyWqwfcvoxhzr75HfUYzBn8FW/5In/kxvpOs42tl6Q
 +zPJV5evfGZ6hrHTbVmZCIAJF/A7cvMqeHywygBgDcNvXmDfqecvsQzWy6biAJssNEb4O3oSt
 U0u6OqlzA2F+tNo/q6h9Ye49efjalKbDxQYCdZfBZdXN3utUpzkiMlioGKRjx/C4S2amMPsJa
 2GZYLwmzM2z3TeSjxaj0qNBcI/+LPQF6atOrfjeEr36kgVVuDVaDv35khoZEfnvWPltGai97+
 HhIolYijJqEwOZS+8Szy8j4NSSjZgyYD4DvFBwrxRlzbWUbBbVhOqm+Qwb3oR3Hj6lUuFF/KJ
 UuqObZtVccCdlQb3tOFEM1+RD1sXJQivUcq+w4vD/1YFDqIi/8e0+EkPecXfRlyxgjmduIHGG
 6O26K0Hzl8dTDdWVyb3o3RpE9jEWTpEatHNyqx+IBnxcdF11BPrJcPkuBUSJQYt5AimaAb23U
 4YSck3qQW3BV4MOH49UKsuijquvVe/1ioaM5Wc0VAbf1MghrJOIoI6Q2VphFxHo+bDtCZQU7q
 ZM3sNNP9sT5O0np5/a7850WXUSpW2vx2G0eUHpIdRSqH8czwiawE/yF+mN1DFEfdN6YB+46ND
 LCj+J0v92VaZRr9Sums4U0AkYTIuYoGxcnDJ/1ROH81P7CcTBE0XKTCuxyo0MnKvRHoL3ZK0u
 lscYueMXjHPNNnrSty/3Iw8fT4k3Hqk+TCDlbxJ7NQMZRbYVd2kxiptPUuMj72nHDBZic60rm
 8eml5y8sUMjFmkLbK3Q02FAI0KBjUtpkUAIti8jRUT2eUwy8EWaQBdgKPJ+HitfEuXEld5zs5
 CIicNJFe9iJSaT1e8V75YpiDPxvBMaqgfnTsubgjHJAE2ZLa+70tWFmiRSbYvZ4yPV5HmofQF
 PnqvGHy65fXwdRDWo0pNAU0FZ4tsxrVFw72yv6ZRWlPwKyO+v8LlsIAO8qNdAiXp717C774FZ
 Ze75DojgCsHlZHRZekw3qh8x7kyoeqHBN6Z9IDz0ArsOxNbwfF6jWYvgcdYFdF8/2sD3xwuBa
 N4NV7BQTRBuJLRCw/vZ3vKN33z85JTGqgFaKb2iIA15SZwkyFmsslJt9xc73JqnRHxCtMqT3m
 a2CnxaYdEPIguWgNcNP3cuLA0NaJJ+HulB9GbH8qHd4vIEvUuMNzDlOVPxf1roSQ4wTT8W88h
 c/WctztJigBYjJ718iF20dyziENjNvUdrO8tSg34TEE7oRCIDA7as2oJhpLrfmUBLL3U/kOg7
 PxYneBkOMzfyBF5rCt0vhdIcnHzhuCv958uWNPeA2gOtgpirfK9JVN/pWhRI8CyO/KastBAc9
 t0yh3NgzHv2rixpBVG8CObrzaE3jGU3y+jfEtlq9r+Nc2MhhS4rxMJJAq7mvFnzppcklDvyvT
 7vrnleYgaPoHbRXv7xymYFOl9yTqtaEzR5QtsRChiEVONaX4TxRCDQwVHpKdih7LG3L+aNmia
 9WW24sCjrTgXGebSxm4U11vjSEU5TE/WkShGLunRjyI3PFRngnO6EdumomEjcyHvvpAJkr7Dt
 iSOsmoYcOGW/fHFYDQlsWp8zBdWO1/gzq/S9z+QhNQjRXwiWYjOXBXVsHhpAKWTS6Hx4NOyXi
 ksECE/z/EbNJHI0Cg3EcZNPDqQu8NMCG2BMSH+TSKqQXlh9zb4YLgLV9a6yvD0YUkjLJvlxfA
 xekdo0oUHMyzTimbvQnjNIwOk1Cw4MjXGUMGSGV/TNgeiZra5/dbdxKZNyg9FPGLS+oU+QD87
 hu8+pekwBd1zSduoBus9aWkTyd3pYd7cfHxfphN+39Qi+LM7KJCtBpdu+R4Id0zWtypp/j4J5
 GoSDJ0LBXI+7dKqdV/OIQW6LIAfAJMeSF9WgCx/UFe+RSqqLKZ9zGlSRGNkWd/t+3Sc6MtWNg
 sV0KMlIoUMGySefCU1eAHsHNXb7ruZxTj8Rr75sJHvCZkVsT9y26TVVYsISrtgMW/dV7mXQ28
 qzfYrZClk=

Some variables in the 'ALSA/core' are initialized only during the init
phase in the '__init' functions and never changed. So, mark them as
__ro_after_init to reduce the attack surface.

Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 sound/core/hrtimer.c              | 2 +-
 sound/core/oss/pcm_oss.c          | 4 ++--
 sound/core/rawmidi.c              | 4 ++--
 sound/core/seq/oss/seq_oss_init.c | 4 ++--
 sound/core/seq/seq_dummy.c        | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
index 9fcd1c03d..92c585f8e 100644
=2D-- a/sound/core/hrtimer.c
+++ b/sound/core/hrtimer.c
@@ -20,7 +20,7 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("snd-timer-" __stringify(SNDRV_TIMER_GLOBAL_HRTIMER));
=20
 #define NANO_SEC	1000000000UL	/* 10^9 in sec */
-static unsigned int resolution;
+static unsigned int resolution __ro_after_init;
=20
 struct snd_hrtimer {
 	struct snd_timer *timer;
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 33fd34f0d..402089e3f 100644
=2D-- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -32,8 +32,8 @@
=20
 #define OSS_ALSAEMULVER		_SIOR ('M', 249, int)
=20
-static int dsp_map[SNDRV_CARDS];
-static int adsp_map[SNDRV_CARDS] =3D {[0 ... (SNDRV_CARDS-1)] =3D 1};
+static int dsp_map[SNDRV_CARDS] __ro_after_init;
+static int adsp_map[SNDRV_CARDS] __ro_after_init =3D {[0 ... (SNDRV_CARDS=
-1)] =3D 1};
 static bool nonblock_open =3D 1;
=20
 MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>, Abramo Bagnara <abramo@a=
lsa-project.org>");
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 3b1034a44..4dfd9d53e 100644
=2D-- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -28,8 +28,8 @@ MODULE_DESCRIPTION("Midlevel RawMidi code for ALSA.");
 MODULE_LICENSE("GPL");
=20
 #ifdef CONFIG_SND_OSSEMUL
-static int midi_map[SNDRV_CARDS];
-static int amidi_map[SNDRV_CARDS] =3D {[0 ... (SNDRV_CARDS-1)] =3D 1};
+static int midi_map[SNDRV_CARDS] __ro_after_init;
+static int amidi_map[SNDRV_CARDS] __ro_after_init =3D {[0 ... (SNDRV_CARD=
S-1)] =3D 1};
 module_param_array(midi_map, int, NULL, 0444);
 MODULE_PARM_DESC(midi_map, "Raw MIDI device number assigned to 1st OSS de=
vice.");
 module_param_array(amidi_map, int, NULL, 0444);
diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_os=
s_init.c
index d3e6a8a8d..1aece46c8 100644
=2D-- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -27,8 +27,8 @@ static int maxqlen =3D SNDRV_SEQ_OSS_MAX_QLEN;
 module_param(maxqlen, int, 0444);
 MODULE_PARM_DESC(maxqlen, "maximum queue length");
=20
-static int system_client =3D -1; /* ALSA sequencer client number */
-static int system_port =3D -1;
+static int system_client __ro_after_init =3D -1; /* ALSA sequencer client=
 number */
+static int system_port __ro_after_init =3D -1;
=20
 static int num_clients;
 static struct seq_oss_devinfo *client_table[SNDRV_SEQ_OSS_MAX_CLIENTS];
diff --git a/sound/core/seq/seq_dummy.c b/sound/core/seq/seq_dummy.c
index af45f328a..3fe0853aa 100644
=2D-- a/sound/core/seq/seq_dummy.c
+++ b/sound/core/seq/seq_dummy.c
@@ -71,7 +71,7 @@ struct snd_seq_dummy_port {
 	int connect;
 };
=20
-static int my_client =3D -1;
+static int my_client __ro_after_init =3D -1;
=20
 /*
  * event input callback - just redirect events to subscribers
=2D-=20
2.43.0

