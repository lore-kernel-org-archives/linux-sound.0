From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 06 Oct 2015 11:37:12 +0000
Subject: Re: [PATCH] ASoC: codecs: tas2552: fix dBscale-min declaration
Message-Id: <5613B268.6040701@ti.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1444075214-21206-1-git-send-email-dannenberg@ti.com>
In-Reply-To: <1444075214-21206-1-git-send-email-dannenberg@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andreas Dannenberg <dannenberg@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Axel Lin <axel.lin@ingics.com>, Lars-Peter Clausen <lars@metafoo.de>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org

On 10/05/2015 11:00 PM, Andreas Dannenberg wrote:
> The minimum volume level for the TAS2552 (control register value 0x00)
> is -7dB however the driver declares it as -0.07dB.
>=20
> Running amixer before the patch reports:
> dBscale-min=3D-0.07dB,step=3D1.00dB,mute=3D0
>=20
> Running amixer with the patch applied reports:
> dBscale-min=3D-7.00dB,step=3D1.00dB,mute=3D0

I have not noticed this when fixing the mute parameter.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  sound/soc/codecs/tas2552.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
> index e3a0bca..cc1d398 100644
> --- a/sound/soc/codecs/tas2552.c
> +++ b/sound/soc/codecs/tas2552.c
> @@ -549,7 +549,7 @@ static struct snd_soc_dai_driver tas2552_dai[] =3D {
>  /*
>   * DAC digital volumes. From -7 to 24 dB in 1 dB steps
>   */
> -static DECLARE_TLV_DB_SCALE(dac_tlv, -7, 100, 0);
> +static DECLARE_TLV_DB_SCALE(dac_tlv, -700, 100, 0);
> =20
>  static const char * const tas2552_din_source_select[] =3D {
>  	"Muted",
>=20


--=20
P=E9ter
